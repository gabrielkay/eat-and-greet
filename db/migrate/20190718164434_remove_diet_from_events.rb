class RemoveDietFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :diet, :string
  end
end
