class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments
  belongs_to :user
  has_many :upvotes
  has_many :downvotes
end
