require 'test_helper'

class BlogPostsTest < Capybara::Rails::TestCase

  def blog_post
    @blog_post = blog_posts :one
  end

  test 'can create, update, and change statused of posts to save and submit' do
    sign_in_user
    click_on "Write a new post"
    fill_in("title", with: "Cool title")
    fill_in("description", with: "Cool description")
    fill_in("content", with: "Boring content")
    click_on("Submit")
    assert page.has_content?("Cool title has been created")
    assert page.has_content?("Saved")
    click_on("Edit")
    fill_in("title", with: "I have made a horrible mistake")
    fill_in("description", with: "Boring description")
    fill_in("content", with: "Cool content")
    click_on("Submit")
    assert page.has_content?("I have made a horrible mistake has been saved")
    assert page.has_content?("Saved")
    click_on("Submit")
    assert page.has_content?("I have made a horrible mistake has been submited")
    assert page.has_content?("Submitted")
    click_on("Save")
    assert page.has_content?("I have made a horrible mistake has been saved")
    assert page.has_content?("Saved")
  end
end
