class Event < ActiveRecord::Base
  attr_accessible :organization, :name, :phone, :email, :organization_address, :organization_address2, :organization_city, 
                  :organization_state, :organization_zip, :organization_country, :url, :event_type, :theme, :starts_at, :ends_at, 
                  :estimated_attendance, :other_speakers, :budget_for_additional_traveller, :housing, :bethel_students, 
                  :bethel_students_total, :bethel_student_housing, :location_name, :address, :address2, :city, :state, 
                  :zip, :country, :country_code, :information, :airport

  attr_accessible :organization, :name, :phone, :email, :organization_address, :organization_address2, :organization_city, 
                  :organization_state, :organization_zip, :organization_country, :url, :event_type, :theme, :starts_at, :ends_at, 
                  :estimated_attendance, :other_speakers, :budget_for_additional_traveller, :housing, :bethel_students, 
                  :bethel_students_total, :bethel_student_housing, :location_name, :address, :address2, :city, :state, 
                  :zip, :country, :country_code, :information, :airport, :status, :title, :as => :admin      
  
  validates :organization, :name, :phone, :email, :presence => true
  validates_date :starts_at, :after => :today, :allow_nil => false, :allow_blank => false, :after_message => "must be a date in the future"
  validates_date :ends_at, :on_or_after => :starts_at, :allow_nil => true, :allow_blank => true, :after => "must be on or after start date"
  validates_format_of :url, :with => /^(((http|https?):\/\/)?((?:[-a-z0-9]+\.)+[a-z]{2,})).*/i, :message => "has an invalid format", :if => :url_filled?
  validates_numericality_of :estimated_attendance, :only_integer => true, :allow_nil => true, :greater_than => 0
  
  STATUS_LIST = %w[new processing declined accepted published_to_website]
  
  def accepted?
    status == "accepted" || status == "published_to_website"
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
  
  def self.by_status(status)
    if status == "all"
      where("status is not null")
    else
      where("status = ?", status)
    end  
  end 
  
  def self.website_listing
    where("status = ? and ((starts_at > ? and ends_at is ?) or (ends_at > ? and ends_at is not ?))", "published_to_website", Date.today, nil, Date.today, nil)
  end
  
  def location
    [city, state, country].compact.reject { |s| s.blank? }.join(', ')
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
#  url                             :string(255)
#  event_type                      :string(255)
#  theme                           :text
#  starts_at                       :date
#  ends_at                         :date
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
#  status                          :string(255)     default("new")
#  created_at                      :datetime        not null
#  updated_at                      :datetime        not null
#  title                           :string(255)
#

