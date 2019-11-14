# frozen_string_literal: true

require 'test_helper'

class ModeratorFuncionalitiesTest < Capybara::Rails::TestCase
  def blog_post
    @blog_post = blog_posts :one
  end

  test 'see list of posts with approve/decline/suggest options after login as a mod - approve' do
    sign_in_mod
    blog_post.update(user: User.last)
    assert page.has_content?(blog_post.title)
    assert page.has_content?('Approve/Decline/Suggest')
    click_on('Approve/Decline/Suggest')
    assert page.has_content?(blog_post.content)
    click_button('Approve')
    assert page.has_content?('Post has been approved!')
    assert page.has_no_content?('Approve/Decline/Suggest')
  end

  test 'see list of posts with approve/decline/suggest options after login as a mod - decline' do
    sign_in_mod
    blog_post.update(user: User.last)
    assert page.has_content?(blog_post.title)
    assert page.has_content?('Approve/Decline/Suggest')
    click_on('Approve/Decline/Suggest')
    assert page.has_content?(blog_post.content)
    click_button('Decline')
    assert page.has_content?('Post has been declined!')
    assert page.has_no_content?('Approve/Decline/Suggest')
  end

  test 'see list of posts with approve/decline/suggest options after login as a mod - suggest' do
    sign_in_mod
    blog_post.update(user: User.last)
    assert page.has_content?(blog_post.title)
    assert page.has_content?('Approve/Decline/Suggest')
    click_on('Approve/Decline/Suggest')
    assert page.has_content?(blog_post.content)
    click_button('Add Suggestions')
    fill_in('suggestion', with: 'You should go and eat a ****!')
    click_on('Submit')
    assert page.has_content?('Suggestions have been submitted!')
  end

  test 'not a moderator cannot access moderator site' do
    sign_in_user
    visit moderator_blog_posts_path
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end
