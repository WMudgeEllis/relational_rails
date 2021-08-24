class CreateBookshelves < ActiveRecord::Migration[5.2]
  def change
    create_table :bookshelves do |t|
      t.string :name
      t.boolean :full
      t.integer :capacity

      t.timestamps
    end
  end
end
