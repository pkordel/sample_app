class User < ApplicationRecord
  has_secure_password

  attr_accessor :remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
                    uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  before_save { self.email = email.downcase }

  class << self
    # Returns a hash digest of a string
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # Remembers a user in the database for use in persistent sessions
  def remember!
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
    remember_digest
  end

  # Returns a session token to prevent session hijacking.
  # We reuse the remember digest for convenience.
  def session_token
    remember_digest || remember!
  end

  # Forgets a user
  def forget!
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.blank?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
