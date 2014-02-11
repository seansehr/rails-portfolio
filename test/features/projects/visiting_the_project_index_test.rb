require "test_helper"

feature "As an employer, I want to visit a developer's portfolio" do
  scenario "viewing all projects" do
    visit projects_path
    page.text.must_include "How meta"
    page.text.must_include "Twitter API"
  end
end
