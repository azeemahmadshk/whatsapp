class AddImagesToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :images, :attachments
  end
end
