class AddCOlumnsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :product_name, :string
    add_column :products, :price, :decimal
  end
end
