module Moderator
  class BlogPostsController < ApplicationController
    def index
      render :index, locals: {posts: BlogPost.all}
    end
  end
end
