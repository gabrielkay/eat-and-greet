class Event < ApplicationRecord

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: 'user'
  has_many :comments, dependent: :destroy
  has_one_attached :event_pic

  validates :restaurant, presence: true
  validates :city, presence: true
  validates :start_time, presence: true
  validates :creator_id, presence: true

  def self.search_location(location, id)
    events = Event.where(city: location)
    .where('id NOT IN (SELECT event_id FROM memberships WHERE user_id = ?)', id).reject do |event|
      event.members.count == event.max_people
    end
  end

  def self.build_with_member(user, event_params)
    event = self.new(event_params)
    event.city = user.location
    event.creator_id = user.id
    event.memberships.build(user_id: event.creator_id)
    event
  end
end
