class Event < ApplicationRecord
  has many :attendings
  has_many :users, through: :attendings
end
