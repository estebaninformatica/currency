class CreateChangeHistoricals < ActiveRecord::Migration
  def change
    create_table :change_historicals do |t|
      t.references :change, index: true
      t.datetime :start_dt
      t.datetime :end_dt
      t.float :amount

      t.timestamps null: false
    end
    add_foreign_key :change_historicals, :changes
   
  end
end
