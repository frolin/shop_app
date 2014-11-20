class ProductItemsController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:create]
  before_action :set_product_item, only: [:show, :edit, :update, :destroy]


  def create

    product = Product.find(params[:product_id])
    @product_item = @cart.product_items.build(product: product)

    respond_to do |format|
      if @product_item.save
        format.html { redirect_to @product_item.cart,
                                   notice: 'Line item was successfully created.' }
        format.json { render action: 'show',
                             status: :created, location: @product_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_item.errors,
                             status: :unprocessable_entity }
      end
    end


  end



    private

    def product_item_params
      params.require(:product_item).permit(:product_id, :cart_id)
    end





end

