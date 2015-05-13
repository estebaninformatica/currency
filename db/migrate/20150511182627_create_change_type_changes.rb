class CreateChangeTypeChanges < ActiveRecord::Migration
  def change
    create_table :change_type_changes do |t|
      t.references :change, :all_change ,index: true
      t.references :type_change, index: true

      t.timestamps null: false
    end
  end
end
