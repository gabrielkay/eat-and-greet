class Event < ApplicationRecord

  attr_writer :date_field, :start_time_field, :end_time_field

  LOCATIONS = [ "Denver-Boulder, CO", "Washington, DC", "Raleigh-Durham, NC" ]

  scope :past, -> { where("start_time < ?", DateTime.now.beginning_of_day) }
  scope :future, -> { where("start_time > ?", DateTime.now.beginning_of_day) }

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: 'user'
  has_many :comments, dependent: :destroy
  has_one_attached :event_pic

  validates :restaurant, presence: true
  validates :city, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :creator_id, presence: true

  def self.search_location(location, id)
    events = Event.where(city: location)
    .where('id NOT IN (SELECT event_id FROM memberships WHERE user_id = ?)', id).reject do |event|
      event.members.count == event.max_people
    end
  end

  def date_field
    return unless start_time
    start_time.strftime("%Y-%m-%d")
  end

  def start_time_field
    return unless start_time
    start_time.strftime("%H:%M:%S")
  end

  def end_time_field
    return unless end_time
    end_time.strftime("%H:%M:%S")
  end

  def self.build_with_member(user, event_params)
    event = self.new(event_params)
    event.min_people = 2
    event.creator_id = user.id
    event.memberships.build(user_id: event.creator_id)
    event
  end
end
