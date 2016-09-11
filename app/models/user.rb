class User < ActiveRecord::Base
  has_many :tweets
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many :following, through: :active_relationships, source: :followed
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, presence: true

  # Defines a proto-feed
  def feed
    Tweet.where("user_id = ?", id)
  end
end
