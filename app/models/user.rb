class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :events, foreign_key: 'creator_id', class_name: 'Event', dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :events_as_member, through: :memberships, source: 'event'
  has_many :comments, dependent: :destroy
  has_one_attached :profile_pic

  validates :name, presence: true
  validates :location, presence: true
  validate :topics_limit
  validates :twitter_link, url: true
  validates :instagram_link, url: true
  validates :facebook_link, url: true
  validate :password_complexity

  before_create :set_slug

  def to_param
    slug
  end

  def get_time_zone
    if location == "Denver-Boulder, CO"
      "Mountain Time (US & Canada)"
    else
      "Eastern Time (US & Canada)"
    end
  end

  private

  def set_slug
    parameterized_name = self.name.parameterize
    similar_slugs = User.where("slug LIKE ?", "#{parameterized_name}%").pluck(:slug)
    unless similar_slugs.include? parameterized_name
      self.slug = parameterized_name
      return
    end
    n = 1
    while similar_slugs.include?("#{parameterized_name}-#{n}")
      n += 1
    end
    self.slug = "#{parameterized_name}-#{n}"
  end

  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def topics_limit
    return if topics.nil?

    unless topics.count(",") < 5
      errors.add(:topics, ': You must have 5 or less topics')
    end
  end

  def password_complexity
    return if password.blank? || password =~ /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,50}$/
    errors.add :password, 'Password must be 8-50 characters and include at least 1 letter and 1 number'
  end
end
