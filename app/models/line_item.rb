class LineItem < ApplicationRecord
  belongs_to :cater_order_option
  belongs_to :cart
  
  def total_price
    cater_order_option.price * quantity
  end
end
