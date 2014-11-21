class ProductItemsController < InheritedResources::Base
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_product_item, only: [:show, :edit, :update, :destroy]


  def create

    product = Product.find(params[:product_id])
    @product_item = @cart.add_product(product.id)
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

def update

end


def destroy

end

    private
# Never trust parameters from the scary internet, only allow the white
# list through.
    def product_item_params
      params.require(:product_item).permit(:product_id, :cart_id)
    end

  def set_product_item
    @product_item = Product.find(params[:id])
  end





end

