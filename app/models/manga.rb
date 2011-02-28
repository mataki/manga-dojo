class Manga < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :author

  validates_presence_of :user, :title, :author
end
