class Event < ApplicationRecord
  has many :attendings
  has_many :attendees, through: :attendings,foreign_key: "attendee_id", class_name: "User"
  has_one :creator, foreign_key: "creator_id", class_name: "User"
end
