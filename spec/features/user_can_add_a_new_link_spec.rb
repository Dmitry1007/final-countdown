require 'rails_helper'

RSpec.describe "User can add a new link", type: :feature do
  context "as an authenticated user" do
    let!(:user) { User.create!(email_address: "brosky@mail.com", password: "password", password_confirmation: "password") }

    it "can add a link" do
      visit login_path

      fill_in "Email address", with: user.email_address
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Login"

      expect(current_path).to eq links_path

      expect(page).to have_content("Add Link")

      fill_in "Title", with: "New Title"
      fill_in "Url", with: "http://www.mad-awesome-stuff.com"
      click_button "Add Link"

      expect(current_path).to eq links_path
      expect(page).to have_content("New Title")
      expect(page).to have_content("http://www.mad-awesome-stuff.com")
    end

    it "cannot submit an invalid link" do
      visit login_path

      fill_in "Email address", with: user.email_address
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Login"

      expect(current_path).to eq links_path

      fill_in "Title", with: "Boooo"
      fill_in "Url", with: "blah blah"
      click_button "Add Link"

      expect(page).not_to have_content("Boooo")
      expect(page).to have_content("There was problem creating your link")
    end
  end
end
