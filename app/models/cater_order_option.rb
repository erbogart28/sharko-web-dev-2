class CaterOrderOption < ApplicationRecord
    has_many :line_items
    before_destroy :ensure_not_referenced_by_any_line_item
    
    private
        #Check to ensure no line items are referencing this product
        def ensure_not_referenced_by_any_line_item
            unless line_items.empty?
                errors.add(:base, 'Line Items Present')
                #if aborted row is not destroyed
                throw :abort
            end   
        end
end
