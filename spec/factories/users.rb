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

# Read about factories at http://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    firstname 'Test'
    lastname 'User'  
    sequence(:email) { |n| "user#{n}@test.com" }
    password 'abcdef'
    role 'user'
    sign_in_count 10  
    confirmed_at '2011-04-25 19:11:53'
    confirmation_sent_at '2011-04-24 19:11:53'  
  end
end
