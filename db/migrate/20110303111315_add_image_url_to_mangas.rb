class AddImageUrlToMangas < ActiveRecord::Migration
  def self.up
    add_column :mangas, :image_url, :text
  end

  def self.down
    remove_column :mangas, :image_url
  end
end
