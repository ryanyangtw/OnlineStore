class AddBankAccountToStores < ActiveRecord::Migration
  def change
    add_column :stores, :bank_account, :string
  end
end
