class Manga < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :author
end
