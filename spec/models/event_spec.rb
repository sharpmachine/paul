require File.dirname(__FILE__) + '/../spec_helper'

describe Event do
  after(:each) do
    ActiveRecord::Base.logger = nil
  end
  
  let(:event) { FactoryGirl.create(:event) }

  let(:show_sql) { ActiveRecord::Base.logger = Logger.new(STDOUT) }

  context "associations" do
#    it { should belong_to(:) }
#    it { should have_many(:) }
  end
  
  context "fields" do
      it { should have_db_column(:organization).of_type(:string) }
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:phone).of_type(:string) }
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:organization_address).of_type(:string) }
      it { should have_db_column(:organization_address2).of_type(:string) }
      it { should have_db_column(:organization_city).of_type(:string) }
      it { should have_db_column(:organization_state).of_type(:string) }
      it { should have_db_column(:organization_zip).of_type(:string) }
      it { should have_db_column(:organization_country).of_type(:string) }
      it { should have_db_column(:url).of_type(:string) }
      it { should have_db_column(:event_type).of_type(:string) }
      it { should have_db_column(:theme).of_type(:text) }
      it { should have_db_column(:starts_at).of_type(:date) }
      it { should have_db_column(:ends_at).of_type(:date) }
      it { should have_db_column(:estimated_attendance).of_type(:integer) }
      it { should have_db_column(:other_speakers).of_type(:string) }
      it { should have_db_column(:budget_for_additional_traveller).of_type(:boolean) }
      it { should have_db_column(:housing).of_type(:string) }
      it { should have_db_column(:bethel_students).of_type(:boolean) }
      it { should have_db_column(:bethel_students_total).of_type(:integer) }
      it { should have_db_column(:bethel_student_housing).of_type(:boolean) }
      it { should have_db_column(:location_name).of_type(:string) }
      it { should have_db_column(:address).of_type(:string) }
      it { should have_db_column(:address2).of_type(:string) }
      it { should have_db_column(:city).of_type(:string) }
      it { should have_db_column(:state).of_type(:string) }
      it { should have_db_column(:zip).of_type(:string) }
      it { should have_db_column(:country).of_type(:string) }
      it { should have_db_column(:information).of_type(:text) }
      it { should have_db_column(:airport).of_type(:string) }
      it { should have_db_column(:status).of_type(:string) }
    
  end

  context "basic validations" do
    it { should validate_presence_of(:organization) }    
    it { should validate_presence_of(:name) }             
    it { should validate_presence_of(:phone) }                 
    it { should validate_presence_of(:email) }  
    it { should validate_numericality_of(:estimated_attendance) }                     
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
#  non_specific_date_info          :string(255)
#  banner                          :string(255)
#

