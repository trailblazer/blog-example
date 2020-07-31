# frozen_string_literal: true

module BlogPost::Moderator
  module Operation
    class Approve < Trailblazer::Operation
      step :model
      fail :model_not_found, fail_fast: true
      step :approve_post
      fail :approve_error

      def model(ctx, params:, **)
        ctx[:model] = BlogPost.find(params[:blog_post_id])
      end

      def approve_post(ctx, model:, **)
        ctx[:approved] = model.update(status: :approved)
      end

      # !!--ERRORS--!!

      def model_not_found(ctx, **)
        ctx[:errors] = 'BlogPost was not found'
      end

      def approve_error(ctx, **)
        ctx[:errors] = 'Blog Post could not have been approved'
      end
    end
  end
end
