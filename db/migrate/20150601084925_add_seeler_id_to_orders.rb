class AddSeelerIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :seller_id, :integer, index: true
  end
end
