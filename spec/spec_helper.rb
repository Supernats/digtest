# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

def sign_up_as_test_user(str)
  visit new_user_url
  fill_in "username", :with => str
  fill_in "password", :with => "password"
  click_button "Sign Up"
end

def logout_test_user
  click_button "Sign Out"
end

def create_a_public_goal(str)
  visit new_goal_url
  fill_in "goal_name", :with => str
  click_button "Create Goal"
end

def create_a_cheer_on_goal(goal_name, user_name)
  @goal = Goal.find_by_name(goal_name)
  @user = User.find_by_username(user_name)
  visit goal_url(@goal)
  click_button "Cheer Goal"
end

def create_a_private_goal(str)
  visit new_goal_url
  fill_in "goal_name", :with => str
  choose("goal_private")
  click_button "Create Goal"
end

def edit_goal_name(str, goal_id)
  visit edit_goal_url(goal_id)
  fill_in "goal_name", :with => str
  click_button("Update Goal")
end