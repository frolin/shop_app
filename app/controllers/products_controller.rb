class ProductsController < ApplicationController
  # before_filter :authenticate_admin!, :except => [:show]
  before_action :set_product, only: [:show]

  respond_to :html, :xml, :json


  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    flash[:notice] = 'Product was successfully created.' if @product.save

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'User was successfully created.' }
        format.js   {}
        format.json { render json: @product,
                      status: :created,
                      location: @product
                    }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    flash[:notice] = 'Product was successfully updated.' if @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :image, :price)
    end
end
