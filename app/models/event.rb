class Event < ApplicationRecord
  has_many :attendings
  has_many :attendees, through: :attendings, foreign_key: "attendee_id", class_name: "User"
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"
end
