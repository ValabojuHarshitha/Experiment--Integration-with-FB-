class Cart < ActiveRecord::Base
  attr_accessible :buyer_id, :product_id, :quantity, :seller_id, :total
end
