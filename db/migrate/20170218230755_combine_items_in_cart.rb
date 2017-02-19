class CombineItemsInCart < ActiveRecord::Migration[5.0]
  def up
    Cart.all.each do |cart|
      # count the number of items in cart
      sums = cart.line_items.group(:cater_order_option_id).sum(:quantity)

      sums.each do |cater_order_option_id, quantity|
        if quantity > 1
          # remove individual items
          cart.line_items.where(cater_order_option_id: cater_order_option_id).delete_all

          # replace with a single item
          item = cart.line_items.build(cater_order_option_id: cater_order_option_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # split items with quantity>1 into multiple items
    LineItem.where("quantity>1").each do |line_item|
      # add individual items
      line_item.quantity.times do 
        LineItem.create(
          cart_id: line_item.cart_id,
          cater_order_option_id: line_item.cater_order_option_id,
          quantity: 1
        )
      end

      # remove original item
      line_item.destroy
    end
  end
end
