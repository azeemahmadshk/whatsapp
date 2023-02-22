class AddNoficationRefToSeenBy < ActiveRecord::Migration[6.1]
  def change
    add_reference :seen_bies, :notification, null: false, foreign_key: true
  end
end
