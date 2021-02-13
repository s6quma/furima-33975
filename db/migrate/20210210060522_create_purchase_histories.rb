class CreatePurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_histories do |t|
      t.references :user, null: false, foreignkey: true
      t.references :item, null: false, foreignkey: true
      t.timestamps
    end
  end
end
