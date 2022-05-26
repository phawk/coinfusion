require "rails_helper"

RSpec.describe "mutation register" do
  it "creates a new account returning a token" do
    result = CoinfusionSchema.execute(register_query, variables: {
      accountType: "individual",
      email: "test@example.com",
      password: "long-password!",
      name: "Test",
      dateOfBirth: "1990-01-01"
    })
    expect(result.dig("data", "register", "email")).to eq("test@example.com")
    expect(result.dig("data", "register", "name")).to eq("Test")
    expect(result.dig("data", "register", "token")).not_to be_blank
  end

  it "returns an error when validation fails" do
    result = CoinfusionSchema.execute(register_query, variables: {
      accountType: "individual",
      email: "test@example.com",
      password: "",
      name: "Test",
      dateOfBirth: "1990-01-01"
    })
    expect(result["errors"].first["message"]).to eq("Register failed.")
  end

  def register_query
    <<~GQL
      mutation Register($accountType: AccountType!, $email: String!, $password: String!, $name: String!, $dateOfBirth: String!) {
        register(
          input: {
            accountType: $accountType,
            email: $email,
            password: $password,
            name: $name,
            dateOfBirth: $dateOfBirth
          }
        ) {
          name
          email
          token
        }
      }
    GQL
  end
end
