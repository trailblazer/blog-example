# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authenticate
  protect_from_forgery

  def authenticate
    render file: '/public/404.html' if current_user.nil?
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
