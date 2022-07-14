class RemoveAdminUserIdFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :admin_user_id, :integer
  end
end
