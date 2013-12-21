require 'spec_helper'

describe "creating a goal" do
  before(:each) do
    sign_up_as_test_user("jane_doe")
  end
  it "adds simple goal successfully" do
    create_a_learn_ruby_goal
    expect(page).to have_content("Learn Ruby")
  end
  it "can't make goal unless logged_in?" do
    logout_test_user
    visit new_goal_url
    expect(page).to have_content("Sign In")
  end
  it "making goal requires name" do
    visit new_goal_url
    click_button "Create Goal"
    expect(page).to have_content("Name can't be blank")
  end

end


describe "viewing a goal" do
  before(:each) do
    sign_up_as_test_user("jane_doe")
  end
  it "view your own goals successfully" do
    create_a_learn_ruby_goal
    visit goals_url
    expect(page).to have_content("Learn Ruby")
  end

  it "view others' public goals" do
    create_a_public_goal("Learn Ruby")
    logout_test_user
    sign_up_as_test_user("john_doe")
    visit user_url(User.find(1))
    expect(page).to have_content("Learn Ruby")
  end
  it "cannot view others' private goals" do

  end
  it "can't view any goals unless logged_in?"

end


describe "editing a goal" do
  # update goal successfully
  # can only update your own goals

end


describe "removing a goal" do
  # can remove a goal
  # can only remove your own goals
  # removes dependent cheers --> :dependent => :destroy (on has_many assoc)

end

