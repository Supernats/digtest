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

class User < ActiveRecord::Base
  attr_accessible :password, :username, :cheer_count
  attr_reader :password

  validates :password_digest, :username, :session_token, :presence =>true
  validates :password, :length => { :minimum => 6 }, :on => :create

  before_validation :reset_session_token, :set_initial_cheer_count

  has_many :created_goals, :class_name => "Goal", :foreign_key => "owner_id"
  has_many :cheers, :class_name => "Cheer", :foreign_key => "cheerleader_id"

  has_many :cheered_goals, :through => :cheers, :source => :goal

  def self.find_by_credentials(usr, pas)
    user = User.find_by_username(usr)
    return user if user && user.is_password?(pas)
    nil
  end

  def self.generate_token
    SecureRandom.urlsafe_base64
  end

  def set_initial_cheer_count(count = 10)
    self.cheer_count = count
  end

  def is_password?(pt)
    BCrypt::Password.new(self.password_digest).is_password?(pt)
  end

  def make_cheer!(goal)
    if self.cheer_count > 0
      Cheer.create!(:goal_id => goal.id, :cheerleader_id => self.id)
      self.cheer_count -= 1
    else
      raise "Insufficient cheers"
    end
  end

  def password=(pt)
    @password = pt
    self.password_digest = BCrypt::Password.create(pt)
  end

  def private_goals
    @private_goals ||= self.created_goals.where("public = 0")
  end

  def public_goals
    @public_goals ||= self.created_goals.where("public = 1")
  end

  def reset_session_token
    self.session_token = User.generate_token
  end

  def reset_session_token!
    self.reset_session_token
    self.save!
  end

end
