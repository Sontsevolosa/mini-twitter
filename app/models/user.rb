class User < ActiveRecord::Base
  has_many :tweets
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many :passive_relatioships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relatioships, source: :follower
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, presence: true

  # Defines a proto-feed
  def feed
    Tweet.where("user_id = ?", id)
  end

  # Follows a user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end
end
