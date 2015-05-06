class CreateTypeChanges < ActiveRecord::Migration
  def change
    create_table :type_changes do |t|
      t.references :change, index: true
      t.string :name
      t.datetime :start_dt
      t.datetime :end_dt
      t.float :amount

      t.timestamps null: false
    end
  end
end
