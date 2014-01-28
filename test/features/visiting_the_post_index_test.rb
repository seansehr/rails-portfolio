require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts" do
    # Given existing posts
    Post.create(title: "Weeeeeeeee", body: "I can fly!")

    # When I visit /posts
    visit posts_path

    # Then the existing posts should be loaded
    page.must_have_content "Weeeeeeeee"
  end
end
