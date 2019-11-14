# frozen_string_literal: true

class BlogPost < ApplicationRecord
  enum status: %w[saved submitted approved declined published edit_requested]
  belongs_to :user
  has_many :comments
  has_many :suggestions
end
