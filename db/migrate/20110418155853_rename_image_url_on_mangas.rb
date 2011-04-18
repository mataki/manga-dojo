class RenameImageUrlOnMangas < ActiveRecord::Migration
  def self.up
    rename_column :mangas, :image_url, :amazon_image_url
  end

  def self.down
    rename_column :mangas, :amazon_image_url, :image_url
  end
end
