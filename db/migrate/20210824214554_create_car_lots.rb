class CreateCarLots < ActiveRecord::Migration[5.2]
  def change
    create_table :car_lots do |t|
      t.string :name
      t.boolean :being_cleaned
      t.integer :lot_area

      t.timestamps 
    end
  end
end
