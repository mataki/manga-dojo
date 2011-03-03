require "amazon/ecs"

Amazon::Ecs.configure do |options|
  options[:aWS_access_key_id] = ENV["AMAZON_ACCESS_KEY"]
  options[:aWS_secret_key] = ENV["AMAZON_SECRET_KEY"]
end
