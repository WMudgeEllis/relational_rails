class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.boolean :read
      t.integer :read_time
      t.references :bookshelf, foreign_key: true

      t.timestamps
    end
  end
end
