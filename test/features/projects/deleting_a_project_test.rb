require "test_helper"

feature "As the site owner, I want to delete a portfolio item so that I can keep the list focused on my best work" do
  scenario "deleting a project" do
    login
    visit project_path(projects(:portfolio))
    first(:link, "Destroy").click
    page.text.must_include "has been deleted"
  end
end
