class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.string :icon_url
      t.string :page_url

      t.timestamps
    end
  end
end
