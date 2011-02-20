require 'omniauth/oauth'

app_id = ENV["FACEBOOK_APP_ID"]
app_secret = ENV["FACEBOOK_APP_SECRET"]
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook , app_id , app_secret , { :scope => 'email, status_update, publish_stream' }
end
