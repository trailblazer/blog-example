# frozen_string_literal: true

module Session
  module Operation
    class Authenticate < Trailblazer::Operation

      step :find_user
      fail :user_not_found, fail_fast: true
      step :authenticate_user
      fail :user_not_authorized

      def find_user(ctx, params:, **)
        ctx[:user] = User.find_by(email: params['email'])
      end

      def authenticate_user(ctx, user:, params:, **)
        ctx[:authenticated] = user.authenticate(params['password'])
      end

      # !!--ERRORS--!!

      def user_not_found(ctx, **)
        ctx[:error] = "User with this email does not exist"
      end

      def user_not_authorized(ctx, **)
        ctx[:error] = "Those credentials were horrible! Try again?"
      end
    end
  end
end
