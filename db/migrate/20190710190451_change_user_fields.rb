class ChangeUserFields < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bio, :text
    add_column :users, :twitter_link, :string
    add_column :users, :instagram_link, :string
    add_column :users, :facebook_link, :string
    add_column :users, :topics, :string
    remove_column :users, :diet, :string
  end
end
