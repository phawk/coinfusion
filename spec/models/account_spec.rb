require "rails_helper"

RSpec.describe Account, type: :model do
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to allow_value("test@example.org").for(:email) }
  it { is_expected.not_to allow_value("test.org").for(:email) }
  it { is_expected.to validate_presence_of :password }
end
