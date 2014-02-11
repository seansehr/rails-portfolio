require "test_helper"

feature "As the site owner, I want to edit a portfolio item so that I can update new project details" do
  scenario "editing a current project" do
    name = projects(:portfolio).name
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "Updated Info"
    click_on "Update Project"
    page.text.must_include "success"
    page.text.must_include "Updated Info"
    page.text.wont_include name
  end
  scenario "incorrectly editing an existing project" do
    visit edit_project_path(projects(:portfolio))
    fill_in "Name", with: "Err"
    click_on "Update Project"
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
   end
end
