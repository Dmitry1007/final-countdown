require 'rails_helper'

RSpec.describe "User can update link", type: :feature do
  context "as a authenticated user" do
    let!(:user) { User.create!(email_address: "dmitry@mail.com", password: "password", password_confirmation: "password") }
    let!(:link) { Link.create!(title: "cool stuff", url: "http://www.cool-stuff.com", user_id: user.id) }

    it "can edit a link" do
      visit login_path

      fill_in "Email address", with: user.email_address
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Login"

      expect(current_path).to eq links_path

      expect(page).to have_content link.title
      expect(page).to have_content link.url

      click_link "Edit"
      fill_in "Title", with: "spaceX"
      fill_in "Url", with: "http://www.spaceX.com"
      click_button "Update Link"

      expect(current_path).to eq links_path
      expect(page).to have_content "spaceX"
      expect(page).to have_content "http://www.spaceX.com"
      expect(page).not_to have_content "cool stuff"
      expect(page).not_to have_content "http://www.cool-stuff.com"
    end

    it "cannot successfully edit link with invalid url" do
      visit login_path

      fill_in "Email address", with: user.email_address
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Login"

      expect(current_path).to eq links_path
      expect(page).to have_content "cool stuff"
      expect(page).to have_content "http://www.cool-stuff.com"

      click_link "Edit"
      fill_in "Title", with: "not so cool stuff"
      fill_in "Url", with: "httx://www.sneaky.com"
      click_button "Update Link"

      expect(page).to have_content "Please enter a valid URL"
    end
  end
end
