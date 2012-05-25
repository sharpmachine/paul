require File.dirname(__FILE__) + '/../spec_helper'

describe <%= class_name %> do
  after(:each) do
    ActiveRecord::Base.logger = nil
  end
  
  before(:each) do
    FactoryGirl.create(:<%= singular_name %>)
  end

  let(:show_sql) { ActiveRecord::Base.logger = Logger.new(STDOUT) }

  context "associations" do
#    it { should belong_to(:) }
#    it { should have_many(:) }
  end
  
  context "fields" do
    <%- for attribute in model_attributes -%>
      it { should have_db_column(:<%= attribute.name %>).of_type(:<%= attribute.type %>) }
    <%- end -%>    
  end

  context "basic validations" do
#    it { should validate_presence_of(:name) }         
  end
  
end  
