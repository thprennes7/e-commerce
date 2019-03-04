class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :user_id
      t.string :stripe_customer_id
      t.timestamps
    end
  end
end
