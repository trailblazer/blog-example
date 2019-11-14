# frozen_string_literal: true

module BlogPosts
  class StatusSubmitsController < ApplicationController

    def create
      result = BlogPost::Operation::StatusSubmit.(params: params)
      if result
        flash[:notice] = "#{result[:model].title} has been submited."
        return redirect_to blog_post_path(result[:model].id)
      end
      flash[:alret] = "There was an error submiting the post"
      redirect_to blog_post_path(result[:model].id)
    end
  end
end
