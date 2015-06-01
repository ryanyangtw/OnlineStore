class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.text :introduction
      t.integer :user_id, index: true
    end
  end
end
