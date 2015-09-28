class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :OpenId
      t.string :mobile

      t.timestamps null: false
    end
  end
end
