class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.date :start_dt
      t.date :end_dt
      t.boolean :drop , default: false

      t.timestamps null: false
    end
  end
end
