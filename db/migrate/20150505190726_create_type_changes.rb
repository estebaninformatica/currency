class CreateTypeChanges < ActiveRecord::Migration
  def change
    create_table :type_changes do |t|
      t.string :name
      t.datetime :start_dt
      t.datetime :end_dt
      t.boolean :drop , default: false

      t.timestamps null: false
    end
  end
end
