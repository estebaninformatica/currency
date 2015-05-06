class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.references :currency , :currency_from
      t.references :currency , :currency_to
      t.datetime :start_dt
      t.datetime :end_dt

      t.timestamps null: false
    end
  end
end
