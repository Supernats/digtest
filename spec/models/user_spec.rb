# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  cheer_count     :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  context "associations" do
    it { should have_many(:created_goals) }
    it { should have_many(:cheered_goals) }
    it { should have_many(:cheers) }
  end

  context "ensures mass assignability" do
    it "can assign a username" do
      expect(User.new(:username => "Denise")).to have(0).errors
    end

    it "can assign a password" do
      expect(User.new(:password => "myawesomepassword")).to have(0).errors
    end

  end

end
