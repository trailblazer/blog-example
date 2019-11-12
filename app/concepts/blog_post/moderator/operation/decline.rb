# frozen_string_literal: true

module BlogPost::Moderator
  module Operation
    class Decline < Trailblazer::Operation
      step :model
      fail :model_not_found, fail_fast: true
      step :decline_post
      fail :decline_error

      def model(ctx, params:, **)
        ctx[:model] = BlogPost.find(params[:blog_post_id])
      end

      def decline_post(ctx, model:, **)
        ctx[:declined] = model.update(status: :declined)
      end

      # !!--ERRORS--!!

      def model_not_found(ctx, **)
        ctx[:errors] = 'BlogPost was not found'
      end

      def decline_error(ctx, **)
        ctx[:errors] = 'Blog Post could not have been declined'
      end
    end
  end
end
