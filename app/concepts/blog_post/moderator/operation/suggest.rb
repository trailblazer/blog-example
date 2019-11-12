# frozen_string_literal: true

module BlogPost::Moderator
  module Operation
    class Suggest < Trailblazer::Operation
      step Wrap ->((_ctx), *, &block) { ActiveRecord::Base.transaction { block.call } } do
        step :model
        fail :model_creation_failed, fail_fast: true
        step :blog_post
        fail :blog_post_not_found, fail_fast: true
        step :submit_suggestion
        fail :submission_error
      end
      fail :transaction_error!

      def model(ctx, current_user:, params:, **)
        ctx[:model] = Suggestion.create!(content: params[:content], blog_post_id: params[:blog_post_id], user: current_user)
      end

      def blog_post(ctx, params:, **)
        ctx[:blog_post] = BlogPost.find(params[:blog_post_id])
      end

      def submit_suggestion(ctx, blog_post:, model:, **)
        ctx[:submitted] = blog_post.suggestions << model
        blog_post.save!
      end

      # !!--ERRORS--!!

      def model_creation_failed(ctx, **)
        ctx[:errors] = 'Suggestion failure'
      end

      def blog_post_not_found(ctx, **)
        ctx[:errors] = 'Blog post could not have been found.'
      end

      def submission_error(ctx, **)
        ctx[:errors] = 'Submission error'
      end

      def transaction_error!(ctx, **)
        ctx[:errors] = 'Transaction error'
      end
    end
  end
end
