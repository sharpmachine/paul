# Table-less model for Contact form.
class Contact
  include ActiveModel::Validations  
  include ActiveModel::Conversion  
  extend ActiveModel::Naming

  attr_accessor :firstname, :lastname, :email, :content, :inquiry_id
  
  validates_presence_of :firstname, :lastname, :content
  validates_presence_of :inquiry_id, :message => "needs to be selected"  
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  
  def initialize(attributes = {})  
    attributes.each do |name, value|  
      send("#{name}=", value)  
    end  
  end  

  def persisted?  
    false  
  end
end