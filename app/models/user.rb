# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :blog_posts
  validates_presence_of :email
  validates_uniqueness_of :email
end
