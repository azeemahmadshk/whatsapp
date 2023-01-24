class AddUserRefToUserRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_rooms, :user, null: false, foreign_key: true
  end
end
