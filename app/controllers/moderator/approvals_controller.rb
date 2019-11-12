# frozen_string_literal: true

module Moderator
  class ApprovalsController < ApplicationController
    def new
      render :new, locals: { blog_post: blog_post }
    end

    def create
      result = ::BlogPost::Moderator::Operation::Approve.call(params: params)
      if result[:approved]
        flash[:notice] = 'Post has been approved!'
      else
        flash[:alert] = result[:errors]
      end
      redirect_to moderator_blog_posts_path
    end

    def destroy
      result = ::BlogPost::Moderator::Operation::Decline.call(params: params)
      if result[:declined]
        flash[:notice] = 'Post has been declined!'
      else
        flash[:alert] = result[:errors]
      end
      redirect_to moderator_blog_posts_path
    end

    private

    def blog_post
      @blog_post ||= BlogPost.find(params[:blog_post_id])
    end
  end
end
