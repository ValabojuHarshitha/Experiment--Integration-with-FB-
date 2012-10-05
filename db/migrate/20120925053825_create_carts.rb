class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :quantity
      t.integer :product_id
      t.integer :buyer_id
      t.integer :seller_id
      t.string :total

      t.timestamps
    end
  end
end
