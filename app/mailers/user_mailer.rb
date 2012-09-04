class UserMailer < ActionMailer::Base
  default :to => "rjlarcombe@gmail.com",
          :from => "info@paulmanwaring.com"
  
  helper :application
  
  layout 'email'
  
  def event_notification(event)
    @event = event
    mail(:reply_to => @event.email, :subject => "Invitation for Paul to Speak: #{event.organization}")
  end  

end