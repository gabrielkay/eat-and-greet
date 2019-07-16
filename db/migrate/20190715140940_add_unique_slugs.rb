class AddUniqueSlugs < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :slug, :string

    user_set = execute 'SELECT id, name FROM users'
    user_set.each do |user|
      execute %Q{
        UPDATE users
        SET slug = '#{user['name'].parameterize}-#{user['id']}'
        WHERE id = #{user['id']}
      }
    end

    change_column_null :users, :slug, false
    add_index :users, :slug, unique: true
  end

  def down
    remove_column :users, :slug, :string
  end
end
