class ChangeColumnIsAdminToRole < ActiveRecord::Migration
  def change
    remove_column :users, :is_admin
    add_column :users, :role, :string
  end
end
