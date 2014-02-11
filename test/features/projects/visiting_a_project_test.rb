require "test_helper"

feature "As an employer, I want to visit a project" do
  scenario "viewing a project" do
    visit project_path(projects(:portfolio))
    page.text.must_include projects(:portfolio).name
    page.text.must_include projects(:portfolio).technologies_used
  end
end
