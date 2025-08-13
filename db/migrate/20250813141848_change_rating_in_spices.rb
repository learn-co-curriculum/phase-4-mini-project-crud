class ChangeRatingInSpices < ActiveRecord::Migration[6.1]
  def change
    change_column :spices, :rating, :float
  end
end
