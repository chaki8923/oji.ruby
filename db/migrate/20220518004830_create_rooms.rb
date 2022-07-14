class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|

      t.string :name
      t.integer :admin_user_id
      t.timestamps
    end
  end
end
