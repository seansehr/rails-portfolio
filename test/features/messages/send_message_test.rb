require "test_helper"

feature "Sending a message from the contact form" do

  scenario "submit form data to create a new message" do
    # Given a user visits the contact form
    visit new_message_path

    # When I submit the form
    fill_in "Name", with: "test email"
    fill_in "Email", with: "sean@seansehr.com"
    fill_in "Message", with: "test message"

    # When I submit the form
    click_on "Create Message"

    page.text.must_include "Message sent! Thank you for contacting us."
  end

end
