class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.references :user, foreign_key: true, null: false
      t.references :event, foreign_key: true, null: false

      t.timestamps
    end

    add_reference :events, :creator, index: true, null: false
    add_foreign_key :events, :users, column: :creator_id
  end
end
