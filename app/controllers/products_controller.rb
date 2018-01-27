class ProductsController < ApplicationController
  def add_into_wishlist
    customer = Customer.find_or_create_by(id: params[:customer_id])
    product = Product.find_or_create_by(id: params[:product_id])

    customer.create_wishlist if customer.wishlist.blank?

    customer.wishlist.products << product

    response.headers['Access-Control-Allow-Origin'] = '*'

    render json: true, status: :ok
  end
end
