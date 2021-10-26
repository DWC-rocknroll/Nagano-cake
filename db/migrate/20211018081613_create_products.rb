class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      
      t.integer :genre_id
      t.string :name
      t.string :introduction
      t.integer :tax_out_price
      t.string :image_id
      t.boolean :is_sale_active, default: true
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
