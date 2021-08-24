class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.boolean :sold
      t.integer :price
      t.references :car_lot, foreign_key: true

      t.timestamps
    end
  end
end
