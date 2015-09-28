class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :info

      t.timestamps null: false
    end
  end
end
