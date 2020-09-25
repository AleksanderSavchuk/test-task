class CreateTablets < ActiveRecord::Migration[6.0]
  def change
    create_table :tablets do |t|
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
