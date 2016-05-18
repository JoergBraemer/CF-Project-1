# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => 'gmail.com',
  :user_name => ENV['joebraemer@gmail.com'],
  :password => ENV['vcomG3268'],
  :authentication => 'plain',
  :enable_starttls_auto => true 
}