require 'spec_helper'

describe "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  describe "signing up a user" do
    it "shows username on the homepage after signup" do
      sign_up_as_test_user("jane_doe")
      expect(page).to have_content "jane_doe"
    end
  end
end

describe "logging in" do
  it "shows username on the homepage after login" do
    sign_up_as_test_user("jane_doe")
    click_button "Sign Out"
    visit new_session_url
    fill_in "username", :with => "jane_doe"
    fill_in "password", :with => "password"
    click_button "Sign In"

    expect(page).to have_content "jane_doe"
  end
end

describe "logging out" do
  it "begins with logged out state" do
    visit new_session_url
    expect(page).to have_button "Sign In"
  end
  it "doesn't show username on the homepage after logout" do
    sign_up_as_test_user("jane_doe")
    logout_test_user
    expect(page).to have_no_content "jane_doe"
  end
end

