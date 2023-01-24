class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.string :wallpaper

      t.timestamps
    end
  end
end
