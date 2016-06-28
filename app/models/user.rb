class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :posts
  has_many :comments


  has_secure_password
end
