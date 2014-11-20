module ViewSessionCount
  extend ActiveSupport::Concern

  def session_counter

    if session[:counter].nil?
      session[:counter] = 0
    else
      session[:counter] += 1
    end
  end


  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id

  end





end