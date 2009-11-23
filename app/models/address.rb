class Address < ActiveRecord::Base
  has_many :conference_addresses
  has_many :attendee_addresses
  
  has_many :conferences, :through => :conference_addresses
  has_many :users, :through => :attendee_addresses
  
  using_access_control
  
end
