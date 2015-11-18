require "rails_helper"

RSpec.feature "Registered user can logout", type: :feature do
  context "as an already registered user" do
    let!(:user) { User.create(email_address: "user@gmail.com", password: "password" ) }

    it "can logout" do
      visit root_path
      click_link "Login"

      expect(current_path).to eq login_path

      fill_in "Email address", with: user.email_address
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Login"

      expect(page).to have_content "Logout"
      click_link("Logout")
      expect(page).to have_content("You have succesfully logged out.")
    end
  end
end
