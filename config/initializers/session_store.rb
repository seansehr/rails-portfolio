# Be sure to restart your server when you modify this file.

PortfolioRails4::Application.config.secret_token = if Rails.env.development? or Rails.env.test?
  ('x' * 30) # meets minimum requirement of 30 chars long
else
  ENV['SECRET_TOKEN']
end
