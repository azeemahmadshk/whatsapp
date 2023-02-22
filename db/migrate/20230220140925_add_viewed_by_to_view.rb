class AddViewedByToView < ActiveRecord::Migration[6.1]
  def change
    add_column :views, :viewed_by, :string
  end
end
