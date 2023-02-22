class AddSeenByToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :seen_by, :json
  end
end
