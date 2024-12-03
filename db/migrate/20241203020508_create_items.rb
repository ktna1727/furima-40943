class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null:false
      t.text :description, null:false
      t.integer :price, null:false
      t.references :user, null:false, foreign_key:true
      t.integer :area_id, null:false
      t.integer :category_id, null:false
      t.integer :condition_id, null:false
      t.integer :estimated_shipping_date_id, null:false
      t.integer :shipping_cost_responsibility_id, null:false
      t.timestamps
    end
  end
end
