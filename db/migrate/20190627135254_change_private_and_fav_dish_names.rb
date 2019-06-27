class ChangePrivateAndFavDishNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :private, :is_private
    rename_column :users, :fav_dish, :favorite_dish
  end
end
