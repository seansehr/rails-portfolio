require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    post = Post.create(title: "Weeeeeeeee", body: "I can fly!")
    visit post_path(post)

    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a real gangsta"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_have_content "Post was successfully updated"
    page.text.must_have_content "real gansta"
  end
end
