class RemoveFloatFromSpices < ActiveRecord::Migration[6.1]
  def change
    remove_column :spices, :float
  end
end
