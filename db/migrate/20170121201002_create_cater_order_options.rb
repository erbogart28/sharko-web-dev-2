class CreateCaterOrderOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :cater_order_options do |t|
      t.string :cateringOptions
      t.string :CaterDesc
      t.string :sideOptions
      t.string :sideDesc
      t.decimal :price

      t.timestamps
    end
  end
end
