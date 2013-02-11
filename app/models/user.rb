class User < ActiveRecord::Base
  attr_accessible :name, :email

  has_many :posts, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :email
end