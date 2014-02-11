require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "Sean's Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Foundation, HTML5, CSS3"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.text.must_include "Sean's Portfolio"
    page.text.must_include "Rails"
  end
end
