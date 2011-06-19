class RemoveLaunchesTables < ActiveRecord::Migration
  def self.up
    drop_table :launches
  end

  def self.down
    create_table :launches do |t|
      t.string :email
      t.string :ip_address
      t.timestamps
    end
    
  end
end
