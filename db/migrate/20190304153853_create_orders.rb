class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :item, index: true
      t.belongs_to :user, index: true
      t.string :stripe_customer_id
      t.timestamps
    end
  end
end
