module Moderator
  class BlogPostsController < ModeratorController
    def index
      render :index, locals: {posts: BlogPost.all}
    end
  end
end
