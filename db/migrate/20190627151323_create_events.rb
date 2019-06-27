class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :restaurant, null: false
      t.string :city, null: false
      t.integer :min_people
      t.integer :max_people
      t.datetime :start_time, null: false
      t.text :description

      t.timestamps
    end
  end
end
