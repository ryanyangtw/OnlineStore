class AddStoreIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :store_id, :integer, index: true
  end
end
