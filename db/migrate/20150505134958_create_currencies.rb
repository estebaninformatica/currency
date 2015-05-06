class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.text :description
      t.string :name
      t.string :abbreviation

      t.timestamps null: false
    end
  end
end
