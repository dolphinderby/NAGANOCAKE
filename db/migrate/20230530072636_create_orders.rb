class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :payment_method
      t.integer :total_price
      t.integer :postage
      t.datetime :remember_created_at
      t.datetime :remember_updated_at

      t.timestamps null: false
    end
  end
end
