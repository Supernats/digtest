# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
    name "MyString"
    end_date "2013-12-20"
    start_date "2013-12-20"
    public false
  end
end
