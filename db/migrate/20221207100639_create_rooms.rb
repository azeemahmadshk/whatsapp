class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
t.string :name