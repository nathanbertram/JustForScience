class AddLaunchModel < ActiveRecord::Migration
  def self.up
    create_table :launches do |t|
      t.string :email
      t.string :ip_address
      t.timestamps
    end
  end

  def self.down
    drop_table :launch
  end
end
