class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :attends, dependent: :destroy
  has_many :comments
  has_many :events, through: :attends

  validates :first_name, :last_name, :city, :state, :email, presence: true, on: :create
  validates :password, :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, on: :create
  before_save do
    self.email.downcase!
  end
end
