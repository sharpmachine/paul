class UserMailer < ActionMailer::Base
  default :to => "PaulManwaring.com <invite@paulmanwaring.com>",
          :from => "PaulManwaring.com <info@paulmanwaring.com>"
  
  helper :application
  
  layout 'email'
  
  def event_notification(event)
    @event = event
    mail(:reply_to => @event.email, :subject => "Invitation for Paul to Speak: #{event.organization}")
  end  

  def contact_form(inquiry, contact)
    @inquiry = inquiry
    @contact = contact
    mail(:to => inquiry.email, :subject => "Website contact form: #{inquiry.description}", :reply_to => contact.email)
  end
end