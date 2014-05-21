require "test_helper"

feature "Creating a comment" do
  scenario "submit form data to create a new comment as an anonymous user" do
    post_comment

    page.text.must_include "Comment was successfully created. It will be published once an editor approves it."
  end

  scenario "submit form data to create a new comment as an editor user" do
    login
    post_comment

    page.text.must_include "Comment was successfully created. It will be published once an editor approves it."
    page.text.must_include comments(:comment1).content
  end
end
