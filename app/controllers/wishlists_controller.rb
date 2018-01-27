class WishlistsController < ApplicationController
  def index
    wishlist = Customer.find(params[:customer_id]).wishlist

    product_ids = wishlist.products.pluck(:id)

    response.headers['Access-Control-Allow-Origin'] = '*'

    render json: product_ids, status: :ok
  end

  def create
    customer = Customer.find_or_create_by(id: params[:customer_id])
    product = Product.find_or_create_by(id: params[:product_id])

    customer.create_wishlist if customer.wishlist.blank?

    customer.wishlist.products << product

    response.headers['Access-Control-Allow-Origin'] = '*'

    render json: true, status: :ok
  end

  def destroy
    
  end
end
