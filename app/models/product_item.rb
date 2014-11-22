class ProductItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart



  def total_price
    product.price * product_count
  end



end
