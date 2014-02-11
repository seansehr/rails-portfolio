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

  scenario "new project has invalid data" do
    visit new_project_path
    fill_in "Name", with: "Q"
    click_on "Create Project"
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
   end
end
