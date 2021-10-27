class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      
      t.integer :order_id
      t.integer :product_id
      t.integer :order_quantity
      t.integer :tax_in_price
      t.integer :making_status, default: 0
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
