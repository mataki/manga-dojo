class User < ActiveRecord::Base
  has_many :mangas

  attr_accessible :name

  validates_presence_of :provider, :uid, :name, :oauth_token

  def self.find_or_create_by_rest_graph!(rest_graph)
    data = rest_graph.data
    me = rest_graph.get('me')
    id = me['id'] || data["user_id"]
    self.find_by_uid(id) || self.create_with_rest_graph_data!(me, data)
  end

  def self.create_with_rest_graph_data!(me, data)
    create! do |user|
      user.name = me['name']
      user.uid = me["id"]
      user.oauth_token = data['access_token']
      user.provider = 'facebook'
    end
  end

  def update_oauth_token(access_token)
    self.oauth_token = access_token
    self.save(:validate => false)
  end

  def post_feed(options = {})
    logger.debug "[POST/feed] #{options.inspect}"
    self.client.post("me/feed", options) unless mock?
  end

  def client
    @client ||= RestGraph.new(:access_token => self.oauth_token)
  end

  @@exclude_mock_env = %(production staging)

  def mock?
    !(@@exclude_mock_env.include?(Rails.env) or ENV["FORCE_POST"])
  end
end
