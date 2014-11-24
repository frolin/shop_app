class Cart < ActiveRecord::Base
  has_many :product_items, dependent: :destroy


  def add_product(product_id)

    product = Product.find(product_id)
    current_item = product_items.where(:product_id => product.id).first
    if current_item
      current_item.update_attributes :product_count => current_item.product_count + 1
    else
      current_item = product_items.build(:product_id => product_id)
      product_items << current_item
    end
    current_item
  end

  def total_price

    product_items.to_a.sum { |item| item.total_price}

  end



end
