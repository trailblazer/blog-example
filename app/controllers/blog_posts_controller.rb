# frozen_string_literal: true

class BlogPostsController < ApplicationController
  def new
    render :new
  end

  def create
    # result = BlogPost::Operation::Create.(params: params)
  end

  def destroy; end
end
