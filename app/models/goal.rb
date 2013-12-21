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

class Goal < ActiveRecord::Base
  attr_accessible :end_date, :name, :public, :start_date, :owner_id, :completed

  validates :name, :owner, :presence => true

  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :cheers

  has_many :cheerleaders, :through => :cheers, :source => :cheerleader
end
