class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog_post
end
