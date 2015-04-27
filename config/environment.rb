# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Depot::Application.configure do
  config.action_mailer.delivery_method = :smtp
  
  config.action_mailer.smtp_settings = {
    address:        "exchange.mitrais.com",
    port:           25,
    domain:         "mitrais.com",
    authentication: "plain",
    user_name:      "noreply@philoport.mitrais.com",
    password:       "",
    enable_starttls_auto: true
  }  
end
