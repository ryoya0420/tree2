class User < ApplicationRecord
  validates :name,presence: true
  validates :email,presence: true
  validates :name,length: { maximum: 15}
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])[a-z\d]+\z/
  validates :password,presence: true,format: { with: VALID_PASSWORD_REGEX}
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  
  has_many :products
  has_many :carts
end
