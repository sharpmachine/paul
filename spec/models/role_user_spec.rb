require "spec_helper"
require "cancan/matchers"

# Role: user - Test abilities for regular logged in user.
describe "user abilities" do

  # Set up the user from factory and verify
  before(:each) do
    @user = FactoryGirl.build(:user)
    @ability = Ability.new(@user)
  end
  
  it "should be valid" do    
    @user.valid?.should == true
  end
end  