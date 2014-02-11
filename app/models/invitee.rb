# == Schema Information
#
# Table name: invitees
#
#  id         :integer          not null, primary key
#  rsvp_id    :integer
#  name       :string(255)
#  comming    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invitee < ActiveRecord::Base
  belongs_to :rsvp
  attr_accessible :comming, :name
end
