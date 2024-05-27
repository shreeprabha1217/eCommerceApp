class AddColumnsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :user_id, :integer
    add_column :orders, :product_id, :integer
    add_column :orders, :product_quantity, :integer
    add_column :orders, :total, :decimal
  end
end
