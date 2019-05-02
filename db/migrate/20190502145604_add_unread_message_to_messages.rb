class AddUnreadMessageToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :unread_message, :boolean, :default => true
  end
end
