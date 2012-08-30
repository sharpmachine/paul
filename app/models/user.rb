# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
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
#  role                   :string(255)      default("user")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  slug                   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :role, :as => :superuser
  
  has_many :posts
      
  # ADMIN_ROLES are any ROLE that has access to the /admin/ namespace. So the ROLES list may be longer than the ADMIN_ROLES list.
  ADMIN_ROLES = %w[superuser manager]
  # All User roles are defined here... And set up in the ability.rb class...
  ROLES = %w[superuser manager user]
  
  def is_admin?
    ADMIN_ROLES.include? role 
  end  
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  def name
    firstname + " " + lastname
  end 
end

