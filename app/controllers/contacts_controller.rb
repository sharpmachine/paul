class ContactsController < ApplicationController

  skip_authorization_check
  
  before_filter :set_active_nav
    
  def index
    @contact = Contact.new
    @inquiries = Inquiry.all
  end
  
  def create  
    @contact = Contact.new(params[:contact])

    if @contact.valid?  
      
      @inquiry = Inquiry.find(@contact.inquiry_id)

      UserMailer.contact_form(@inquiry, @contact).deliver
      flash[:notice] = "Your message has been sent."
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