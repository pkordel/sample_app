class User < ApplicationRecord
  has_secure_password

  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
                    uniqueness: true
  validates :password, length: { minimum: 6 }

  before_save { self.email = email.downcase }
end
