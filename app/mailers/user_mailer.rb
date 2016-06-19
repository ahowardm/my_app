class UserMailer < ApplicationMailer
  default from: "aihoward@miuandes.cl"

  def contact_form(email, name, message)
    @message = message
    mail(from: email, 
      to: "ahowardm@gmail.com", 
      subject: "A new contact form from #{name}")
  end

  def welcome(user)
    @appname = "Bike Shop"
    mail(to: user.email, subject: "Welcome to #{@appname}!")
  end
end
