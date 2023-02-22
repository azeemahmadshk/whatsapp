class CreateViews < ActiveRecord::Migration[6.1]
  def change
    create_table :views do |t|

      t.timestamps
    end
  end
end
