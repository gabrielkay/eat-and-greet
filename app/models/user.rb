class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :events, foreign_key: 'creator_id', class_name: 'Event', dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :events_as_member, through: :memberships, source: 'event'

  validates :name, presence: true
  validates :location, presence: true
  validates_with TopicsValidator
  validates_with UrlValidator
end
