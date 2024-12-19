class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|    
      t.string  :post_number, null: false 
      t.string  :municipalities, null: false                   
      t.string  :street_address, null: false                   
      t.string  :building_name                                      
      t.string  :phone_number, null: false                   
      t.references :order,           foreign_key: true,null: false 
      t.integer :area_id,            null:false                    
      t.timestamps
    end
  end
end
