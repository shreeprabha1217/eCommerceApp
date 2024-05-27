class AddProductToOrders < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:orders, :product_id)
      add_reference :orders, :product, null: false, foreign_key: true
    end
  end
end
