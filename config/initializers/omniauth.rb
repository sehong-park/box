#http://railscasts.com/episodes/360-facebook-authentication
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['910064432355300'], ENV['72e3e5d4a3ed2bd8d40dc8466c1892c9']
end