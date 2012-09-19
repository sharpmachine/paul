class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :picture
  has_many :tagships, :dependent => :destroy
  has_many :tags, :through => :tagships  
  
  validates_presence_of :title, :content, :category_id
  
  validates_presence_of :picture_id, :if => :published?
  
  attr_accessible :title, :content, :tag_ids, :category_id, :published_at, :picture_id, :published
  
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
  
  def author
    user.firstname + " " + user.lastname
  end
  
  def self.published
    where("posts.published_at is not null").order("posts.published_at desc")
  end
  
  def published
    published?
  end
  
  def published=(gonna_publish)
    if gonna_publish == "true"
      self.published_at = Time.now unless published?
    else
      self.published_at = nil
    end  
  end
  
  def published?
    published_at.present?
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
#  id           :integer         not null, primary key
#  title        :string(255)
#  content      :text
#  user_id      :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  category_id  :integer
#  slug         :string(255)
#  picture_id   :integer
#  published_at :datetime
#

