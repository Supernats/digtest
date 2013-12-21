# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  end_date   :date
#  start_date :date
#  owner_id   :integer          not null
#  public     :integer          default(1)
#  completed  :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Goal do
  context "associations" do
    it { should belong_to(:owner) }
    it { should have_many(:cheers) }
    it { should have_many(:cheerleaders) }
  end

  context "ensures mass assignability" do
    it "can assign an owner" do
      expect(Goal.new(:owner_id => 1)).to have(0).errors
    end

    it "can assign a name" do
      expect(Goal.new(:name => "great goal")).to have(0).errors
    end

    it "can assign an start_date" do
      expect(Goal.new(:start_date => Date.today)).to have(0).errors
    end

    it "can assign an end_date" do
      expect(Goal.new(:end_date => Date.tomorrow)).to have(0).errors
    end

    it "can assign public/private" do
      expect(Goal.new(:public => 0)).to have(0).errors
    end

    it "can be set to completed" do
      expect(Goal.new(:completed => 1)).to have(0).errors
    end

  end

  # :end_date, :name, :public, :start_date, :owner_id
end
