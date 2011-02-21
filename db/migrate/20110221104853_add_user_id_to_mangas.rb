class AddUserIdToMangas < ActiveRecord::Migration
  def self.up
    add_column :mangas, :user_id, :integer
  end

  def self.down
    remove_column :mangas, :user_id
  end
end
