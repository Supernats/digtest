require 'spec_helper'

describe "creating a goal" do
  before(:each) do
    sign_up_as_test_user("jane_doe")
  end
  it "adds simple goal successfully" do
    create_a_public_goal("Learn Ruby")
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
    create_a_public_goal("Learn Ruby")
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
    create_a_private_goal("Mow Lawn")
    logout_test_user
    sign_up_as_test_user("john_doe")
    visit user_url(User.find(1))
    expect(page).to have_no_content("Mow Lawn")
  end
  it "can't view any goals unless logged_in?" do
    logout_test_user
    visit goals_url
    expect(page).to have_content("Sign In")
  end
end


describe "editing a goal" do
  before(:each) do
    sign_up_as_test_user("jane_doe")
    create_a_public_goal("Learn Ruby")
    edit_goal_name("Forget Ruby", 1)
  end
  it "can edit goal from show page" do
    visit goal_url(1)
    click_button "Edit Goal"
    expect(page).to have_content("Edit Goal")
  end
  it "update goal successfully" do
    expect(page).to have_content("Forget Ruby")
    expect(page).to have_no_content("Learn Ruby")
  end

end


describe "removing a goal" do
  before(:each) do
    sign_up_as_test_user("jane_doe")
    create_a_public_goal("Learn Ruby")
  end

  it "can remove a goal" do
    visit goals_url
    click_button "Remove Goal"
    expect(page).to have_no_content("Learn Ruby")
  end

  it "removes dependent cheers" # --> :dependent => :destroy (on has_many assoc)

end

