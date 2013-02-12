class Tag < ActiveRecord::Base
  attr_accessible :name, :post_ids

  has_many :post_tags
  has_many :posts, :through => :post_tags

  validates_presence_of :name
end