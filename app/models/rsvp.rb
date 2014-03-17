# == Schema Information
#
# Table name: rsvps
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  comments   :string(255)
#  responded  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rsvp < ActiveRecord::Base
  attr_accessible :code, :comments, :responded
  attr_accessible :invitee_attributes

  has_many :invitee, dependent: :destroy

  accepts_nested_attributes_for :invitee

  def getNamesForRsvp
    self.invitee.map { |i| i.name }
  end

  def getInvitees coming
    self.invitee.map { |i| (i.coming == coming ? [i.name, i.updated_at] : nil) }.compact
  end

  def self.add csvUrl
    require 'csv'
    require 'open-uri'
    CSV.parse(open(csvUrl), :headers => true) do |row|
      r = Rsvp.create!(code: row['code'], comments: (row['comments'].blank? ? nil : row['comments']))
      row.each do |column, data|
        if column == 'name'
          r.invitee << Invitee.create!(name: data) unless data.blank?
        end
      end
    end
  end
end
