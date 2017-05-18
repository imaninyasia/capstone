class CreateUsershopRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :usershop_relations do |t|
      t.integer :shop_id
      t.integer :user_id

      t.timestamps
    end
  end
end
