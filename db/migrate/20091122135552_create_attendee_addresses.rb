class CreateAttendeeAddresses < ActiveRecord::Migration
  def self.up
    create_table :attendee_addresses do |t|
      t.integer :conference_attendee_id
      t.integer :address_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attendee_addresses
  end
end
