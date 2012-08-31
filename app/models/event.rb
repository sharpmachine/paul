class Event < ActiveRecord::Base
  attr_accessible :organization, :name, :phone, :email, :address, :website, :event_type, :theme, :starts_at, :ends_at, 
                  :estimated_attendance, :other_speakers, :budget_for_additional_traveller, :housing, :bethel_students, 
                  :bethel_students_total, :bethel_student_housing, :location_name, :address, :address2, :city, :state, 
                  :zip, :country, :country_code, :information, :airport

  attr_accessible :organization, :name, :phone, :email, :address, :website, :event_type, :theme, :starts_at, :ends_at, 
                  :estimated_attendance, :other_speakers, :budget_for_additional_traveller, :housing, :bethel_students, 
                  :bethel_students_total, :bethel_student_housing, :location_name, :address, :address2, :city, :state, 
                  :zip, :country, :country_code, :information, :airport, :status, :as => :admin      
  
  STATUS_LIST = %w[new processing declined accepted published_to_website]
  
  def accepted?
    status == "accepted" || status == "published_to_website"
  end
end
# == Schema Information
#
# Table name: events
#
#  id                              :integer         not null, primary key
#  organization                    :string(255)
#  name                            :string(255)
#  phone                           :string(255)
#  email                           :string(255)
#  organization_address            :string(255)
#  organization_address2           :string(255)
#  organization_city               :string(255)
#  organization_state              :string(255)
#  organization_zip                :string(255)
#  organization_country            :string(255)
#  website                         :string(255)
#  event_type                      :string(255)
#  theme                           :text
#  starts_at                       :datetime
#  ends_at                         :datetime
#  estimated_attendance            :integer
#  other_speakers                  :string(255)
#  budget_for_additional_traveller :boolean
#  housing                         :string(255)
#  bethel_students                 :boolean
#  bethel_students_total           :integer
#  bethel_student_housing          :boolean
#  location_name                   :string(255)
#  address                         :string(255)
#  address2                        :string(255)
#  city                            :string(255)
#  state                           :string(255)
#  zip                             :string(255)
#  country                         :string(255)
#  information                     :text
#  airport                         :string(255)
#  status                          :string(255)
#  created_at                      :datetime        not null
#  updated_at                      :datetime        not null
#

