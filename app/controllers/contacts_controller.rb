class ContactsController < ApplicationController

  skip_authorization_check
  
  before_filter :set_active_nav
    
  def index
    @contact = Contact.new
    @contact.inquiry_id = params[:inquiry_id]
    @inquiries = Inquiry.all
  end
  
  def create  
    @contact = Contact.new(params[:contact])

    if @contact.valid?  
      
      @inquiry = Inquiry.find(@contact.inquiry_id)

      UserMailer.contact_form(@inquiry, @contact).deliver
      redirect_to :action => :index, :sent => true

    else  
      @inquiries = Inquiry.all
      render :action => 'index'
    end  
  end
  
  private
  
  def set_active_nav
    @selected_nav = "contact"    
  end  
end