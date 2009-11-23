class CreateConferenceAddresses < ActiveRecord::Migration
  def self.up
    create_table :conference_addresses do |t|
      t.integer :conference_id
      t.integer :address_id

      t.timestamps
    end
  end

  def self.down
    drop_table :conference_addresses
  end
end
