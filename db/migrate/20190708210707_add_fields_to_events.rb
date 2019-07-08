class AddFieldsToEvents < ActiveRecord::Migration[5.2]
  def change
    # applies default values to existing objects for fields that are required
    add_column :events, :title, :string, null: false, default: "Let's Eat"
    add_column :events, :end_time, :datetime, null: false, default: '2019-08-09 19:10:25-07'
    add_column :events, :restaurant_address, :string, null: false, default: '123 Main Street'
    add_column :events, :diet, :string, null: false, default: 'none'
    add_column :events, :topic, :string
    change_column_null :events, :min_people, false, 2
    change_column_null :events, :max_people, false, 4

    # removing default values
    change_column_default(:events, :title, nil)
    change_column_default(:events, :end_time, nil)
    change_column_default(:events, :restaurant_address, nil)
    change_column_default(:events, :diet, nil)
    change_column_default(:events, :min_people, nil)
    change_column_default(:events, :max_people, nil)
  end

end
