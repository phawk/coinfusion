class Account < ApplicationRecord
  enum account_type: {
    individual: "individual",
    company: "company"
  }

  has_secure_password
  validates :name, presence: true
  validates :email, email: true, presence: true
  validates :password, length: { minimum: 8 }
  validates :date_of_birth, presence: true, if: :individual?
  validates :company_number, presence: true, if: :company?
end
