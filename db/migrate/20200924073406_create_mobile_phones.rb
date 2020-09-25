class CreateMobilePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :mobile_phones do |t|
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
