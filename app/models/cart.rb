class Cart < ApplicationRecord
	has_many :line_items, :dependent => :destroy

	def add_product(product_id)
  	current_item = line_items.find_by_product_id(product_id)
  	if current_item
        if current_item.quantity == nil
          current_item.quantity = 1
        else
    		current_item.quantity += 1
        end
  	else
  		  current_item = line_items.build(:product_id => product_id)
  	end
  	   return current_item
  end


  def cart_total_price
    line_items.to_a.sum {|item| item.line_total_price}
  end  

end
