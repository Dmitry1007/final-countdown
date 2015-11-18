require 'rails_helper'

RSpec.describe Link, type: :model do
  let!(:user) { User.create!(email_address: "user@gmail.com", password: "password" ) }
  let!(:link) { Link.create!(title: "badass link", url: "http://do-watch-want.com", user_id: user.id) }

  it "has a user" do
    expect(Link.first.user_id).to eq(user.id)
  end

  it "has a title" do
    expect(link.title).to eq("badass link")
  end

  it "defaults to false" do
    expect(link.read).to eq(false)
  end

  it "is valid with valid url" do
    expect(link).to be_valid
  end

  it "is not valid with invalid url" do
    link.url = "ht://do-watcha-want.com"
    expect(link).to_not be_valid
  end
end
