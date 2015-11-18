require 'rails_helper'

RSpec.describe User, type: :model do
  context "a registered user" do
    let!(:user) { User.create(email_address: "user@gmail.com", password: "password" ) }

    it "is valid" do
      expect(user).to be_valid
    end
  end

  context "an invalid user" do
    let!(:user) { User.create(email_address: "user@gmail.com", password: "password" ) }

    it "is invalid without an email_address" do
      user.email_address = nil
      expect(user).to_not be_valid
    end

    it "is invalid without a password" do
      user.password = nil
      expect(user).to_not be_valid
    end
  end
end
