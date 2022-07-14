class AddRequestFlgToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :requestFlg, :boolean
  end
end
