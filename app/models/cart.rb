class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    
    def add_cater_order_option(cater_order_option)
      current_item = line_items.find_by(cater_order_option_id: cater_order_option.id)
        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(cater_order_option_id: cater_order_option.id)
        end
      current_item
    end
    
    def total_price
        line_items.to_a.sum { |item| item.total_price }
    end
end
