class Cart < ActiveRecord::Base
  has_many :product_items, dependent: :destroy
end
