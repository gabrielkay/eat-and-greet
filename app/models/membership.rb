class Membership < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user_id, presence: true
  validates :event_id, presence: true

  def self.find_membership(user_id, event_id)
    Membership.find_by("user_id = ? AND event_id = ?", user_id, event_id)
  end
end
