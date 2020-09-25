class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.references :user, foreign_key: true
      t.integer :entity_id
      t.string :entity_type

      t.timestamps
    end
  end
end
