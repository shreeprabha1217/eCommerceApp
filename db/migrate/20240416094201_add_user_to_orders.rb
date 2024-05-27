class AddUserToOrders < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:orders, :user_id)
      add_reference :orders, :user, foreign_key: true
    end
  end
end
