class ProductsController < ApplicationController
  def index
    customer = Customer.find_by(id: params[:data_hash][:customer_id])
    product = Product.find_by(id: params[:data_hash][:product_id])

    wish_products = is_product_exist?(customer, product)
    wish_products = false unless wish_products.is_a?(TrueClass)

    response.headers['Access-Control-Allow-Origin'] = '*'

    render json: wish_products, status: :ok
  end

  private

  def is_product_exist?(customer, product)
    customer.wishlist.products.each do |wish_product|
      if wish_product == product
        return true
        break
      end
    end
  end
end
