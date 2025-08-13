class CreateSpices < ActiveRecord::Migration[6.1]
  def change
    create_table :spices do |t|
      t.string :title
      t.string :image
      t.string :description
      t.string :notes
      t.string :rating
      t.string :float

      t.timestamps
    end
  end
end
