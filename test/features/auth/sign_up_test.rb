require "test_helper"

feature("signing up and in") do
  scenario "sign up" do
    visit "/"
    click_on "Sign Up"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "There was a problem with your sign up"
  end

  scenario "login" do
    login

    page.must_have_content "Signed in successfully."
  end

  scenario "logout" do
    login
    
    click_on "Logout"
    page.must_have_content "Signed out successfully."
  end
end
