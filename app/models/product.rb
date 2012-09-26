class Product < ActiveRecord::Base
  attr_accessible :title, :author, :url, :product_type, :image, :featured, :short_description, :remote_image_url, :image_cache
  
  validates_presence_of :title, :author, :url, :product_type, :short_description, :image
  
  validates_length_of :short_description, :maximum => 50, :too_long => "must be 50 words maximum.", :tokenizer => lambda {|str| str.scan(/\w+/) } 
  
  mount_uploader :image, ImageUploader
  
  PRODUCT_TYPES = %w[book teaching_series toolkit]  
  
  before_save :add_ref_to_url
  
  after_save :set_featured_flag, :if => :featured_changed?
  
  include PgSearch
  pg_search_scope :search, against: [:title, :author, :short_description, :product_type],
   using: {tsearch: { dictionary: "english" }} 
  
  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
  
  extend FriendlyId
    friendly_id :title, use: :slugged
  
  def self.get_featured
    find_by_featured(true)
  end
  
  private
  
  def add_ref_to_url
    self.url = url + "?ref=123" unless url.end_with?("?ref=123")
  end
  
  def set_featured_flag
    if featured?
      Product.where("id <> ?", id).update_all :featured => false
    end  
  end
end
# == Schema Information
#
# Table name: products
#
#  id                :integer         not null, primary key
#  title             :string(255)
#  author            :string(255)
#  url               :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  product_type      :string(255)
#  slug              :string(255)
#  featured          :boolean         default(FALSE), not null
#  short_description :text
#  image             :string(255)
#

