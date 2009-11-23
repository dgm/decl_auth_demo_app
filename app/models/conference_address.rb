class ConferenceAddress < ActiveRecord::Base
  belongs_to :address
  belongs_to :conference
end
