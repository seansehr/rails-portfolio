require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: projects(:portfolio).name
    fill_in "Technologies used", with: projects(:portfolio).technologies_used
    # How come the first does not work? cannot attach file, [:with, "a/valid/path"] does not exist
    # attach_file "Image", with: "#{Rails.root}/test/files/Google-Self-Driving-Car.jpg"
    attach_file('project_image', "#{Rails.root}/test/files/Google-Self-Driving-Car.jpg")
    click_on "Create Project"
    page.text.must_include projects(:portfolio).name
    page.text.must_include projects(:portfolio).technologies_used
    # http://stackoverflow.com/questions/6477051/how-do-i-test-an-image-src-and-alt-value-using-capybara
    # TODO: find out how to use a fixture, since the fixture creates an actual
    # image upload it prevents me from using the fixture for this test
    page.find('#project-image')['src'].must_include "Google-Self-Driving-Car.jpg"
    # page.must_include projects(:portfolio).image
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
