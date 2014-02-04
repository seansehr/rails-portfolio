require "test_helper"

feature "CheckForZurb" do
  scenario "check that columns exist" do
    visit root_path
    page.has_css?('.columns')
  end
end
