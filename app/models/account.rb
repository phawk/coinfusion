class Account < ApplicationRecord
  enum role: {
    individual: "individual",
    company: "company"
  }

  has_secure_password
  validates :name, presence: true
  validates :email, email: true, presence: true
  validates :date_of_birth, presence: true
  validates :password, length: { minimum: 8 }
end
