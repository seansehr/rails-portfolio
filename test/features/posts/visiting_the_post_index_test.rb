require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts" do
    # When I visit /posts
    visit posts_path

    # Then the existing posts should be loaded
    page.must_have_content "Weeeeeeeee"
  end
end
