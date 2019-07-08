class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event, optional: true
  belongs_to :comment, optional: true
  has_many :comments, dependent: :destroy

  validates :body, presence: true
  validates :user_id, presence: true
end
