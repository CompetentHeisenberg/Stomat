class User < ApplicationRecord
  has_many :treatment_histories, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }
end
