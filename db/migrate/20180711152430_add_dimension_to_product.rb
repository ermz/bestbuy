class AddDimensionToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :dimension, :string
  end
end
