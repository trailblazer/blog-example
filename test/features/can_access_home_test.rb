# frozen_string_literal: true

require 'test_helper'

class CanAccessHomeTest < Capybara::Rails::TestCase

  test 'cannot login without registration' do
    visit root_path
    click_link('Log In')
    fill_in('Email', with: 'important@person.com')
    fill_in('Password', with: '$3cr3t')
    click_on('Submit')
    assert page.has_content?('User with this email does not exist')
  end

  test 'cannot login with bad password' do
    @user = users :one
    @user.update!(password: '$3cr3t')
    visit root_path
    click_link('Log In')
    fill_in('Email', with: 'some@email.com')
    fill_in('Password', with: 'secret')
    click_on('Submit')
    assert page.has_content?('Those credentials were horrible! Try again?')
  end

  test 'can login and logout' do
    sign_in_user
    assert page.has_content?('You are now logged in!')
    assert page.has_content?('some@email.com')
    click_on('Log Out')
    assert page.has_content?('Logged out!')
  end

  test 'cannot access insides of the app without login' do
    visit moderator_blog_posts_path
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
