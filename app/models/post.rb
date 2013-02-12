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

  def self.most_commented
    Post
      .joins("LEFT OUTER JOIN comments ON posts.id = comments.post_id")
      .group("posts.id")
      .order("COUNT(comments.post_id) DESC")
  end

  def self.group_by_tags
    Post
      .joins("LEFT OUTER JOIN post_tags ON posts.id = post_tags.post_id")
      .group("posts.id")
      .order("COUNT(post_tags.id) DESC")
  end

  def self.group_by_author
    Post
      .group(:user_id)
      .order("COUNT(user_id) DESC")
  end
end