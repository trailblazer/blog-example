# frozen_string_literal: true

class StaticController < ApplicationController
  skip_before_action :authenticate
  def home
    render
  end
end
