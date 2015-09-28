class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :UserId, index: true, foreign_key: true
      t.string :good
      t.integer :goodnum
      t.decimal :price
      t.time :time
      t.references :AddressId, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
