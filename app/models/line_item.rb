class LineItem < ApplicationRecord
	belongs_to :product
	belongs_to :cart
	belongs_to :order
	def line_total_price
		product.price * quantity
	end
end
