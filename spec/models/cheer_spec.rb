# == Schema Information
#
# Table name: cheers
#
#  id             :integer          not null, primary key
#  cheerleader_id :integer          not null
#  goal_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Cheer do

  context "associations" do
    it { should belong_to(:goal) }
    it { should belong_to(:cheerleader) }
  end

  context "ensures mass assignability" do
    it "can assign a cheerleader_id" do
      expect(Cheer.new(:cheerleader_id => 1)).to have(0).errors
    end

    it "can assign a goal_id" do
      expect(Cheer.new(:goal_id => 2)).to have(0).errors
    end

  end

end
