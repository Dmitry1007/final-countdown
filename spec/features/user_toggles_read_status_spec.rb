require 'rails_helper'

RSpec.describe "User can update link", type: :feature, js: true do
  context "as a authenticated user" do
    let!(:user) { User.create!(email_address: "dmitry@mail.com", password: "password", password_confirmation: "password") }
    let!(:link) { Link.create!(title: "cool stuff", url: "http://www.cool-stuff.com", user_id: user.id) }

    it "can toggle read status of link" do
      visit login_path

      fill_in "Email address", with: user.email_address
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Login"

      expect(link.read).to eq(false)
      expect(page).to have_button("Mark As Read")

      click_button("Mark As Read")
      expect(page).to_not have_button("Mark As Read")
    end
  end
end
