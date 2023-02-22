class AddRoomRefToNotification < ActiveRecord::Migration[6.1]
  def change
    add_reference :notifications, :room, null: false, foreign_key: true
  end
end
