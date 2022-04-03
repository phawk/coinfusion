class Account < ApplicationRecord
  enum role: {
    individual: "individual",
    company: "company"
  }
end
