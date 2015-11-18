require "rails_helper"

RSpec.feature "Registered user can log in", type: :feature do
  context "as an already registered user" do
    let!(:user) { User.create(email_address: "user@gmail.com", password: "password" ) }

    it "can login" do
      visit root_path
      click_link "Login"

      expect(current_path).to eq login_path

      fill_in "Email address", with: user.email_address
      fill_in "Password", with: user.password
      click_button "Login"

      expect(page).to have_content "Logout"

      expect(current_path).to eq links_path
    end

    it "can't log in with invalid params" do
      visit root_path
      click_link "Login"

      fill_in "Email address", with: "blah@blah.com"
      fill_in "Password", with: "what-evs"
      click_button "Login"

      expect(page).to have_content "Invalid username or password"
    end
  end
end
