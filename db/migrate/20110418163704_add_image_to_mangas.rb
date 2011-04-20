class AddImageToMangas < ActiveRecord::Migration
  def self.up
    add_column :mangas, :image, :string
  end

  def self.down
    remove_column :mangas, :image
  end
end
