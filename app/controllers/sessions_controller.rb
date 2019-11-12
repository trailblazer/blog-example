# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate
  def new
    render :new
  end

  def create
    result = Session::Operation::Authenticate.(params: params)
    if result[:authenticated] && result[:user].moderator?
      session[:user_id] = result[:user].id
      session[:moderator] = true
      flash[:notice] = 'You are now logged in!'
      redirect_to moderator_blog_posts_path
    elsif result[:authenticated]
      session[:user_id] = result[:user].id
      flash[:notice] = 'You are now logged in!'
      redirect_to root_path
    else
      flash[:alert] = result[:error]
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
