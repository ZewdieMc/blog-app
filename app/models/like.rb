class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  def update_likes_counter
    post_likes = post.likes_counter || 0
    post.update(likes_counter: post_likes + 1)
  end
end
