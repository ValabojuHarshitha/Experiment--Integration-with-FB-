class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :quantity
      t.integer :product_id
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :total_price
      t.integer :receipt_no

      t.timestamps
    end
  end
end
