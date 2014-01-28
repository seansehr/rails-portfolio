require "test_helper"

feature "Creating a post" do
  scenario "submit form data to create a new post" do
    # Given a completed new post form
    visit new_post_path
    fill_in "Title", with: "Sup G"
    fill_in "Body", with: "You don't choose the thug life, the thug life chooses you."

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include "don't choose the thug life, the thug life"
  end
end
