require "test_helper"

feature "Approving a comment" do
  scenario "approve a new comment" do
    post_comment
    login
    visit post_path(posts(:gangsta))

    click_on "Approve Comment"
    page.text.must_include "Comment approved."
    page.text.must_include comments(:comment1).content
  end
end
