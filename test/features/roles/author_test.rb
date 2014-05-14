require "test_helper"

feature "Author Workflow" do
  scenario "authors can't publish" do
    # Given an author's account
    login(:author)

    # When I visit the new page
    visit new_post_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end
end
