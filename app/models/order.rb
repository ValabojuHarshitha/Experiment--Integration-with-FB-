class Order < ActiveRecord::Base
  attr_accessible :buyer_id, :product_id, :quantity, :receipt_no, :seller_id, :total_price
end
