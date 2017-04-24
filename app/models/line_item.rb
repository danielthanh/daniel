class LineItem < ApplicationRecord
	belongs_to :product
	belongs_to :cart

	def line_total_price
		product.price * quantity
	end
end
