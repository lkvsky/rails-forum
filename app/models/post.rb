class Post < ActiveRecord::Base
  attr_accessible :title, :text, :user_id, :tag_ids, :tags_attributes

  belongs_to :user

  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags

  validates_presence_of :user_id
  validates_presence_of :title
  validates_presence_of :text
end