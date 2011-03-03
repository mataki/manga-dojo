require "lib/url_gen"

class Manga < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :author, :image_url

  validates_presence_of :user, :title, :author

  after_create :post_link_to_facebook

  def post_link_to_facebook
    user.post_feed(:link => permalink, :name => self.title, :message => "I created #{self.title} on Manga Dojo!")
  end

  def permalink
    UrlGen.manga_url(self)
  end
end
