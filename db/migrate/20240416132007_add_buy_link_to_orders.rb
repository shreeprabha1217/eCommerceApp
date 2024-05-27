class AddBuyLinkToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :buy_link, :string
  end
end
