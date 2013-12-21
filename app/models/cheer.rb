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

class Cheer < ActiveRecord::Base
  attr_accessible :goal_id, :cheerleader_id

  belongs_to(
    :cheerleader,
    :class_name  => "User",
    :foreign_key => :cheerleader_id
  )
  belongs_to :goal

end
