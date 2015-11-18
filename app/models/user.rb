class User < ActiveRecord::Base
  validates :email_address, uniqueness: true, presence: true
  validates :password, presence: true, length: { in: 3..15 }, confirmation: true

  has_secure_password
  has_many :links
end
