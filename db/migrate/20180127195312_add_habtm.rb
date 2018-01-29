class AddHabtm < ActiveRecord::Migration[5.1]
  def change
    create_table :products_wishlists, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :wishlist, index: true
    end
  end
end
