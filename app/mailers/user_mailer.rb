class UserMailer < ApplicationMailer
  default from: "joebraemer@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'joebraemer@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
end
