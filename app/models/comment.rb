class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def update_comments_counter
    post_comments = post.comments_counter || 0
    post.update(comments_counter: post_comments + 1)
  end
end
