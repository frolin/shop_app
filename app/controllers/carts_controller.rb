class CartsController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  private
    # def cart_params
    #   params.require(:cart).permit()
    # end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path, notice: 'Invalid cart'
  end


end

