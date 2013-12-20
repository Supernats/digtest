class User < ActiveRecord::Base
  attr_accessible :password, :username
  attr_reader :password

  validates :password_digest, :username, :session_token, :presence =>true
  validates :password, :length => { :minimum => 6 }, :on => :create

  before_validation :reset_session_token

  def self.find_by_credentials(usr, pas)
    user = User.find_by_username(usr)
    return user if user && user.is_password?(pas)
    nil
  end

  def self.generate_token
    SecureRandom.urlsafe_base64
  end

  def is_password?(pt)
    BCrypt::Password.new(self.password_digest).is_password?(pt)
  end

  def password=(pt)
    @password = pt
    self.password_digest = BCrypt::Password.create(pt)
  end

  def reset_session_token
    self.session_token = User.generate_token
  end

  def reset_session_token!
    self.reset_session_token
    self.save!
  end

end
