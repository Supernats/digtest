require 'spec_helper'

describe "creating a cheer" do
  before(:each) do
    sign_up_as_test_user("jane_doe")
    create_a_public_goal("Learn Ruby")
  end
  it "adds a cheer successfully" do
    logout_test_user
    sign_up_as_test_user("john_doe")
    create_a_cheer_on_goal("Learn Ruby", "john_doe")
    expect(page).to have_content("john_doe cheered this goal")
    expect(page).to have_content("Learn Ruby")
  end
  it "can't add cheer unless logged_in?" do
    logout_test_user
    visit goal_url(1)
    expect(page).to have_content("Sign In")
  end

  it "can't cheer your own goal"

  it "can view how many cheers are left"

  it "reduces cheer count after using a cheer"

  it "can't add cheer if out of cheers"

end


describe "viewing a goal" do
  before(:each) do
    sign_up_as_test_user("jane_doe")
  end
  it "can view cheers on own goal" do
    create_a_public_goal("Learn Ruby")
    visit goals_url
    expect(page).to have_content("Learn Ruby")
  end

  it "can view cheers on other's public goal" do
    create_a_public_goal("Learn Ruby")
    logout_test_user
    sign_up_as_test_user("john_doe")
    visit user_url(User.find(1))
    expect(page).to have_content("Learn Ruby")
  end

end

# describe "removing a cheer" do
#   before(:each) do
#     sign_up_as_test_user("jane_doe")
#     create_a_public_goal("Learn Ruby")
#   end
#
#   it "can remove a goal" do
#     visit goals_url
#     click_button "Remove Goal"
#     expect(page).to have_no_content("Learn Ruby")
#   end
#
# end

