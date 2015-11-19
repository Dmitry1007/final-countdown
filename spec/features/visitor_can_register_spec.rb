require 'rails_helper'

RSpec.feature "Visitor signs up and is logged in", type: :feature do
  context "a non-registered user" do
    it "can register" do
      visit root_path
      click_link "Sign Up"

      expect(current_path).to eq(new_user_path)

      fill_in "Email address", with: "hotnilly@mail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign Up"

      expect(current_path).to eq(links_path)
      expect(page).to have_content("LINKS")
      expect(page).to have_link("Logout")
    end
  end
end
