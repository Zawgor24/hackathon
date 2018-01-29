class AddParamsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :title, :string
    add_column :products, :price, :float
    add_column :products, :handle, :string
  end
end
