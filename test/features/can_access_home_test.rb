require "test_helper"

feature "Can Access Home Page" do
  scenario "visiting" do
    # visit root_path
    visit "/"
    page.must_have_content "Sean Sehr"
    page.wont_have_content "Goobye All!"
  end
end
