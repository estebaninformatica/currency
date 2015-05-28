class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.text :description
      t.string :abbreviation
      t.boolean :drop , default: false

      t.timestamps null: false
    end
  end
end
