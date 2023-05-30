class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      
      t.integer :item_id
      t.integer :order_id
      t.integer :amount
      t.integer :purchase_price
      t.datetime :remember_created_at
      t.datetime :remember_updated_

      t.timestamps null: false
    end
  end
end
