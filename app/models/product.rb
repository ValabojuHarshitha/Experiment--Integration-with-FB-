class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :admin_id
end
