require "test_helper"

feature "Removing a comment" do
  scenario "remove a new comment" do
    post_comment
    login
    visit post_path(posts(:gangsta))

    click_on "Delete Comment"
    page.text.must_include "Comment deleted."
  end
end
