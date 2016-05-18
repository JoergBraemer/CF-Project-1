# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => 'gmail.com',
  :user_name => ENV['joebraemer@gmail.com'],
  :password => ENV['vcomG3268'],
  :authentication => 'plain',
  :enable_starttls_auto => true 
}

# Initialize the Rails application.
Rails.application.initialize!

