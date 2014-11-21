class AddQuantityToProductItem < ActiveRecord::Migration
  def change
    add_column :product_items, :product_count, :integer, default: 1
  end
end
