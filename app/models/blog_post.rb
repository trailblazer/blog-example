# frozen_string_literal: true

class BlogPost < ApplicationRecord
  enum status: %w[submitted approved declined]
  belongs_to :user
  has_many :comments
  has_many :suggestions
end
