class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :description, :avatar, :url
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :description, :avatar, :url, :role, :as => :superuser
  
  has_many :posts
  
  has_attached_file :avatar, 
                    :styles => { :thumb => "75x75>", :small => "150x150>" },
                    :storage => :s3,
                    :s3_permissions => :public_read,                    
                    :s3_credentials => {
                      :bucket            => ENV['S3_BUCKET_NAME'],
                      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    },
                    :path => "/:class/:id/:attachment/:style/:filename"

  validates_attachment_size :avatar, :less_than => 10.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => "must be JPG, GIF or PNG"  
  validates_format_of :url, :with => /^(((http|https?):\/\/)?((?:[-a-z0-9]+\.)+[a-z]{2,})).*/i, :message => "has an invalid format", :if => :url_filled?  
      
  # ADMIN_ROLES are any ROLE that has access to the /admin/ namespace. So the ROLES list may be longer than the ADMIN_ROLES list.
  ADMIN_ROLES = %w[superuser contributer]
  # All User roles are defined here... And set up in the ability.rb class...
  ROLES = %w[superuser contributer user]
  
  def is_admin?
    ADMIN_ROLES.include? role 
  end  
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  def name
    firstname + " " + lastname
  end 
  
  def url_filled?
    url.present?
  end
  
  def url=(str)
    if str.blank?
      super(str)
    else  
      str = 'http://' + str if str[0,7] != 'http://' && str[0,8] != 'https://'
      super(str)
    end
  end
      
  def paul?
    name == "Paul Manwaring"
  end  
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  firstname              :string(255)
#  lastname               :string(255)
#  role                   :string(255)     default("user")
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  slug                   :string(255)
#  description            :text
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  url                    :string(255)
#

