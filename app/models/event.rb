class Event < ApplicationRecord

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: 'user'
  has_many :comments, dependent: :destroy

  validates :restaurant, presence: true
  validates :city, presence: true
  validates :start_time, presence: true
  validates :creator_id, presence: true
end
