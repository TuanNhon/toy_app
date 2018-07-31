class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.valid.email_syntax
  has_many :microposts
  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: Settings.valid.name_length}
  validates :email, presence: true, length: {maximum: Settings.valid.email_length}, 
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.valid.pwd_length}
  has_secure_password
end
