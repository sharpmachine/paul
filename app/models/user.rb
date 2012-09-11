class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :description, :avatar
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :description, :avatar, :role, :as => :superuser
  
  has_many :posts
  
  has_attached_file :avatar, :styles => { :thumb => "100x75>", :small => "320x240>" },
                    :url  => "/assets/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => "must be JPG, GIF or PNG"  
      
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
#

