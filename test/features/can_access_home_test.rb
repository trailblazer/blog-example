# frozen_string_literal: true

require 'test_helper'

class CanAccessHomeTest < Capybara::Rails::TestCase
  def test_cannot_login_without_registration
    visit root_path
    click_link('Log In')
    fill_in('Email', with: 'important@person.com')
    fill_in('Password', with: '$3cr3t')
    click_on('Login')
    assert page.has_content?('Those credentials were not to my liking. Try again')
  end

  def test_can_login_and_logout
    User.create(email: 'important@person.com', password: '$3cr3t')
    visit root_path
    click_link('Log In')
    fill_in('Email', with: 'important@person.com')
    fill_in('Password', with: '$3cr3t')
    click_on('Login')
    assert page.has_content?('You are now logged in!')
    assert page.has_content?('important@person.com')
    click_on('Log Out')
    assert page.has_content?('Logged out!')
  end
end
