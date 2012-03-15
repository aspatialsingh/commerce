class Product < ActiveRecord::Base
  attr_accessible :name,:category,:description,:warranty ,:cost_price ,:retail_price,
  :sale_price,:weight
end

