# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by(email: params['email'])&.authenticate(params['password'])
    if user
      session[:user_id] = user.id
      flash[:notice] = 'You are now logged in!'
      redirect_to root_path
    else
      flash[:alert] = 'Those credentials were not to my liking. Try again'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
