class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :prefecture, null: false
      t.string :city,        null: false
      t.string :block_number, null: false
      t.string :building_name
      t.string :phone_number,  null: false
      t.references :purchase_history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
