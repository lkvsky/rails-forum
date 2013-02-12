class Post < ActiveRecord::Base
  attr_accessible :title, :text, :user_id

  belongs_to :user
  has_many :comments

  validates_presence_of :user_id
  validates_presence_of :title
  validates_presence_of :text
end