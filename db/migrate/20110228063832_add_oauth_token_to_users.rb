class AddOauthTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :oauth_token, :text
  end

  def self.down
    remove_column :users, :oauth_token
  end
end
