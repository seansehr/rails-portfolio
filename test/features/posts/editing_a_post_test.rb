require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    visit post_path(posts(:gangsta))

    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a real gangsta"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "real gangsta"
  end
end
