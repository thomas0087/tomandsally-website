class Invitee < ActiveRecord::Base
  belongs_to :rsvp
  attr_accessible :comming, :name
end
