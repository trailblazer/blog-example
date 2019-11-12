# frozen_string_literal: true

module Moderator
  class SuggestionsController < ApplicationController
    def new
      render :new, locals: { blog_post: blog_post }
    end

    def create
      result = ::BlogPost::Moderator::Operation::Suggest.call(params: params, current_user: current_user)
      if result
        flash[:notice] = 'Suggestions have been submitted!'
      else
        flash[:alert] = result[:errors]
      end
      redirect_to new_moderator_blog_post_approval_path(blog_post.id)
    end

    private

    def blog_post
      @blog_post ||= BlogPost.find(params[:blog_post_id])
    end
  end
end
