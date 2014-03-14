# == Schema Information
#
# Table name: invitees
#
#  id         :integer          not null, primary key
#  rsvp_id    :integer
#  name       :string(255)
#  coming    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invitee < ActiveRecord::Base
  belongs_to :rsvp
  attr_accessible :coming, :name, :id, :rsvp_id
end
