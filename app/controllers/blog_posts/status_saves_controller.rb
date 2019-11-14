# frozen_string_literal: true

module BlogPosts
  class StatusSavesController < ApplicationController

    def create
      result = BlogPost::Operation::StatusSave.(params: params)
      if result
        flash[:notice] = "#{result[:model].title} has been saved."
        return redirect_to blog_post_path(result[:model].id)
      end
      flash[:alret] = "There was an error saving the post"
      redirect_to blog_post_path(result[:model].id)
    end
  end
end
