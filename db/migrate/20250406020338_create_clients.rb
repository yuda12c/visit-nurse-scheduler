class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name,        null: false
      t.string :address,     null: false
      t.string :insurance,   null: false
      t.string :addition
      t.string :memo     
      t.timestamps
    end
  end
end
