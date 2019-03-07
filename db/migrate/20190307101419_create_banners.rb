class CreateBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :banners do |t|
      t.text :title
      t.string :description

      t.timestamps
    end
  end
end
