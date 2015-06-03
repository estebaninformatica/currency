class CreateTypeChanges < ActiveRecord::Migration
  def change
    create_table :type_changes do |t|
      t.references :currency , :currency_from , index: true
      t.references :currency , :currency_to , index: true
      t.references :category , index: true

      t.float :difference
      t.datetime :start_dt
      t.datetime :end_dt

      t.timestamps null: false
    end
  end
end

