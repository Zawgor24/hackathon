class Product < ApplicationRecord
  has_and_belongs_to_many :wishlists
  has_many :customers, through: :wishlists
end
