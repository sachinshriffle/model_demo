class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :area
      t.string :building_no
      t.string :city_name
      t.references :college, foreign_key: true, null:false
   
      t.timestamps
    end
  end
end
