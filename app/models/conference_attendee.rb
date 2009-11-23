class ConferenceAttendee < ActiveRecord::Base
  using_access_control
  
  belongs_to :user
  belongs_to :conference
  validates_presence_of :user, :conference
  validates_associated :user, :conference
  
  has_many :conference_addresses
  has_many :addresses, :through => :conference_addresses
end
