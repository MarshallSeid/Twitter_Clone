class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: 40} #order seems to matter, length min second didnt work
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 40 }, #, length: { minimum: 3 } # might have to be in same brackets
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false} 
  #validates_length_of :name, :minimum => 5
  validates :password, presence: true, length: {minimum: 6}
  has_secure_password
end
