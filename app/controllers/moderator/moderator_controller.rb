# frozen_string_literal: true

module Moderator
  class ModeratorController < ApplicationController
    before_action :authenticate_mod

    def authenticate_mod
      render file: '/public/404.html' if !session[:moderator]
    end
  end
end
