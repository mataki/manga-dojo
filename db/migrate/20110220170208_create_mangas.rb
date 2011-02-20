class CreateMangas < ActiveRecord::Migration
  def self.up
    create_table :mangas do |t|
      t.string :title
      t.string :author
      t.timestamps
    end
  end

  def self.down
    drop_table :mangas
  end
end
