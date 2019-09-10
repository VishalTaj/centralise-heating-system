class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.belongs_to :thermostat
      t.integer :tracking_number, index: true
      t.float :temperature
      t.float :humidity
      t.float :battery_charge

      t.timestamps
    end
    add_index :readings, [:thermostat_id, :tracking_number], unique: true
  end
end
