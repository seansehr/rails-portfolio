require "test_helper"

feature "Approving a comment" do
  scenario "approve a new comment" do
    post_comment('author')
    login
    visit post_path(posts(:gangsta))

    click_on "Approve"
    page.text.must_include "Comment was successfully updated."
    page.text.must_include comments(:comment1).content
  end
end
