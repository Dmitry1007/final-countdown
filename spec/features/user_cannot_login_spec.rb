require 'rails_helper'

RSpec.describe "User cannot login with invalid email", type: :feature do
  context "user cannot log-in" do
    let!(:user) { User.create!(email_address: "brosky@mail.com", password: "password", password_confirmation: "password") }

    it 'cannot login' do
      visit login_path

      fill_in "Email address", with: "bademailaddress@mail.com"
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Login"

      expect(current_path).to eq login_path
      expect(page).to have_content("Invalid username or password")
    end
  end
end
