require "test_helper"

feature "Removing a comment" do
  scenario "remove a new comment" do
    post_comment('author')
    login
    visit post_path(posts(:gangsta))

    click_on "Destroy"
    page.text.must_include "Comment deleted."
  end
end
