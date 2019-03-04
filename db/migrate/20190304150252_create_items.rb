class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :image_url
      t.decimal :price
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
