class WishlistsController < ApplicationController
  def index
    wishlist = Customer.find(params[:data_hash][:customer_id]).wishlist

    products_data = wishlist.products

    response.headers['Access-Control-Allow-Origin'] = '*'

    render json: products_data, status: :ok
  end

  def create
    customer = Customer.find_or_create_by(id: params[:data_hash][:customer_id])
    product = Product.find_or_create_by(id: params[:data_hash][:product_id])
    product.update(title: params[:data_hash][:product_title], price: params[:data_hash][:product_price],
      handle: params[:data_hash][:product_handle])

    customer.create_wishlist if customer.wishlist.blank?
    customer.wishlist.products << product

    response.headers['Access-Control-Allow-Origin'] = '*'

    render json: true, status: :ok
  end

  def destroy
    
  end

  private

  def product_params
    params.require(:data).permit(:title, :price, :handle)    
  end
end
