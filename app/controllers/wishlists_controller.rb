class WishlistsController < ApplicationController
  before_action :find_customer, only: %i[index]

  include WishlistsHelper

  def index
    wishlist_products = @customer.wishlist.products

    response.headers['Access-Control-Allow-Origin'] = '*'

    render json: wishlist_products, status: :ok
  end

  def create
    customer = Customer.find_or_create_by(id: params[:data_hash][:customer_id])
    product = Product.find_or_create_by(id: params[:data_hash][:product_id])

    product.update(title: params[:data_hash][:product_title], price: fix_price(params[:data_hash][:product_price]).to_f,
      handle: params[:data_hash][:product_handle])

    customer.create_wishlist if customer.wishlist.blank?
    customer.wishlist.products << product

    response.headers['Access-Control-Allow-Origin'] = '*'

    render json: true, status: :ok
  end

  def destroy
    customer = Customer.find(params[:customer_id])
    product = Product.find(params[:product_id])

    customer.wishlist.products.delete(product)

    response.headers['Access-Control-Allow-Origin'] = '*'

    render json: true, status: :ok
  end

  private

  def customer_params
     
  end

  def find_customer
    @customer = Customer.find_by(id: params[:data_hash][:customer_id])
  end
end
