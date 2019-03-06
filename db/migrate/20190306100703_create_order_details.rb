class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.belongs_to :order, index: true
      t.belongs_to :item, index:true
      t.decimal :price
      t.integer :quantity
      t.timestamps
    end
  end
end
