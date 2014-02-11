# == Schema Information
#
# Table name: rsvps
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  comments   :string(255)
#  responded  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rsvp < ActiveRecord::Base
  has_many :invitee, dependent: :destroy
  attr_accessible :code, :comments, :responded
  attr_accessible :invitee_attributes
end
