class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.text :website
      t.integer :hours_of_oparation
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
