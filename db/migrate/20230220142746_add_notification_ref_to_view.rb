class AddNotificationRefToView < ActiveRecord::Migration[6.1]
  def change
    add_reference :views, :notification, null: false, foreign_key: true
  end
end
