class AddDefaultValueForDelete < ActiveRecord::Migration
  def change
    change_column :letters, :deleted, :boolean, default: :false
  end
end
