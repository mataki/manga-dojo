require "lib/url_gen"

class Manga < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :author

  validates_presence_of :user, :title, :author

  after_create :post_link_to_facebook

  def post_link_to_facebook
    user.client.post("me/feed", :link => permalink, :name => self.title, :message => "I created #{self.title} on Manga Dojo!")
  end

  def permalink
    UrlGen.manga_url(self)
  end
end
