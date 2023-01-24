class AddRoomRefToUserRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_rooms, :room, null: false, foreign_key: true
  end
end
