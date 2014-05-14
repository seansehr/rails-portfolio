require "test_helper"

feature "Editor Workflow" do
  scenario "editors can publish" do
    # Given an editor's account
    login(:editor)

    # When I visit the new page
    visit new_post_path

    # There is a checkbox for published
    page.must_have_field('Published')

    # When I submit the form
    fill_in "Title", with: posts(:weeeeeeeee).title
    fill_in "Body", with: posts(:weeeeeeeee).body
    check "Published"
    click_on "Create Post"

    # Then the published post should be shown
    page.text.must_include "Status: Published"
  end
end
