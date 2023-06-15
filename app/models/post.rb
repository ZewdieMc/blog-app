class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_posts_counter
    author.update(posts_counter: author.posts.count + 1)
  end

  def recenet_comments
    comments.order(created_at: :desc).limit(5)
  end
end
