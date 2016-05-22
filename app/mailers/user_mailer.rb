class UserMailer < ApplicationMailer
  default from: "contact@bike-berlin.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email, 
      to: "ahowardm@gmail.com", 
      subject: "A new contact form from #{name}")
  end
end
