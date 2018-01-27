class Customer < ApplicationRecord
  has_one :wishlist
  has_many :products, through: :wishlists
end
