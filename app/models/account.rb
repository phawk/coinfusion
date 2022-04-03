class Account < ApplicationRecord
  enum role: {
    individual: "individual",
    company: "company"
  }

  has_secure_password
  validates :name, presence: true
  validates :email, email: true, presence: true
end
