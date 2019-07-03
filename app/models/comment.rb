class Comment < ApplicationRecord
  validates :body, presence: true
  validates :user_id, presence: true
  validates :event_id, presence: true

  belongs_to :user
  belongs_to :event
  belongs_to :comment, optional: true
  has_many :comments
end
