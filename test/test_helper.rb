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

class Capybara::Rails::TestCase
  def sign_in_mod
    visit root_path
    click_link('Log In')
    @moderator = users :moderator
    @moderator.update!(password: '$3cr3t')
    fill_in('Email', with: 'mod@email.com')
    fill_in('Password', with: '$3cr3t')
    click_on('Submit')
  end

  def sign_in_user
    visit root_path
    click_link('Log In')
    @user = users :one
    @user.update!(password: '$3cr3t')
    fill_in('Email', with: 'some@email.com')
    fill_in('Password', with: '$3cr3t')
    click_on('Submit')
  end
end
