class CreateUsersDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :users_devices do |t|
      t.references :user
      t.references :device
    end
  end
end
