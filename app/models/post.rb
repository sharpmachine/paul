# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  published   :boolean          default(FALSE)
#  slug        :string(255)
#

class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, :counter_cache => true  
  has_many :tagships, :dependent => :destroy
  has_many :tags, :through => :tagships  
  
  validates_presence_of :title, :content, :category_id
  
  attr_accessible :title, :content, :tag_ids, :category_id, :published
  
  extend FriendlyId
  friendly_id :title, use: :slugged   
  
  include PgSearch
  pg_search_scope :search, against: [:title, :content],
   using: {tsearch: { dictionary: "english" }} 
  
  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end   
end