require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create a new post" do
    login
    # Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:weeeeeeeee).title
    fill_in "Body", with: posts(:weeeeeeeee).body

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.has_css? "#author"
    page.text.must_include users(:editor).email # Use your fixture name here.
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:weeeeeeeee).title
  end
end
