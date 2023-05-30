class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.string :name
      t.text :introduction
      t.integer :price
      t.datetime :remember_created_at
      t.datetime :remember_updated_at

      t.timestamps null: false
    end
  end
end
