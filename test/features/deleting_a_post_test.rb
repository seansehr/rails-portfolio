require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    Post.create(title: "Weeeeeeeee", body: "I can fly!")
    visit posts_path

    # When the delete link is clicked
    click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content "Weeeeeeeee"
  end
end
