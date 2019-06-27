class Event < ApplicationRecord
  validates :restaurant, presence: true
  validates :city, presence: true
  validates :start_time, presence: true
end
