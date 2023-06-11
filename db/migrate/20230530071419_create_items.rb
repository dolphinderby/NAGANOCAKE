class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.datetime :remember_created_at
      t.datetime :remember_updated_at

      t.timestamps null: false
    end
  end
end
