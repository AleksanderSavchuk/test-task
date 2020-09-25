class CreateSensorChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :sensor_checks do |t|
      t.references :tablet, foreign_key: true
      t.integer :sensor_type_id
      t.string :value
      t.datetime :time

      t.timestamps
    end
  end
end
