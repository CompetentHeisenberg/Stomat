class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/}
  #validates :password length: { minimum: 8 }
            #format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/}
end
