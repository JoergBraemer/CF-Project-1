class UserMailer < ApplicationMailer
  default from: "joebraemer@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'joebraemer@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
  @appname = "Fictional Bike Shop"
  	mail( :to => user.email,
  			  :subject => "Welcome to #{@appname}!")
	end

end
