class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, confirmation: true, uniqueness: true,
            :presence => {:message => "Vui long nhap Email" },
            :format   => { :with => VALID_EMAIL_REGEX, :message => "Email is invalid format"}     
  has_secure_password
  validates :password, confirmation: true, presence: true, allow_blank: true
end
