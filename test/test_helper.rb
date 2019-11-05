# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'tests'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/rails/capybara'

# Consider setting MT_NO_EXPECTATIONS to not add expectations to Object.
# ENV["MT_NO_EXPECTATIONS"] = true

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
