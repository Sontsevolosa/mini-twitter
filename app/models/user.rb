class User < ActiveRecord::Base
  has_many :tweets
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  validates :password, presence: true
end
