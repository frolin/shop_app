class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :product_id, index: true
      t.string :name
      t.text :description



      t.timestamps
    end
  end
end
