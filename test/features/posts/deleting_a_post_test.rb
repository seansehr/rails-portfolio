require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    login
    # Given an existing post
    visit posts_path

    # When the delete link is clicked
    first(:link, "Destroy").click

    # Then the post is deleted
    page.wont_have_content "Weeeeeeeee"
  end
end
