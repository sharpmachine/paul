class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :picture
  has_many :tagships, :dependent => :destroy
  has_many :tags, :through => :tagships  
  
  validates_presence_of :title, :content, :category_id
  
  attr_accessible :title, :content, :tag_ids, :category_id, :published, :picture_id
  
  after_save :cache_post_counts
  after_destroy :cache_post_counts  
    
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
  
  ROOT_URL = "http://localhost:3000"
  
  def self.published
    where("posts.published = ?", true).order("posts.updated_at")
  end
  
  def picture_url(size = :small)
    #  :styles => { :thumb => "100x75>", :small => "320x240>", :medium => "480x360>", :square => "360x360#", :large => "640x480>" }
    case size.to_s                
    when "thumb"
      if picture
        ROOT_URL + picture.image.url(:thumb)
      else 
        ROOT_URL + "/assets/nophoto_thumb.png"
      end
    when "small"
      if picture
        ROOT_URL + picture.image.url(:small)
      else 
        ROOT_URL + "/assets/nophoto_small.png"
      end     
    when "medium"
      if picture
        ROOT_URL + picture.image.url(:medium)
      else 
        ROOT_URL + "/assets/nophoto_medium.png"
      end
    when "square"
      if picture
        ROOT_URL + picture.image.url(:square)
      else 
        ROOT_URL + "/assets/nophoto_square.png"
      end      
    when "large"
      if picture
        ROOT_URL + picture.image.url(:large)
      else 
        ROOT_URL + "/assets/nophoto_large.png"
      end              
    end
  end
  
  private
  
  def cache_post_counts
    Tag.all.each {|t| t.update_attributes(:posts_count => t.posts.count) }
    Category.all.each {|c| c.update_attributes(:posts_count => c.posts.count) }    
  end
end
# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  content     :text
#  user_id     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  category_id :integer
#  published   :boolean         default(FALSE)
#  slug        :string(255)
#  picture_id  :integer
#

