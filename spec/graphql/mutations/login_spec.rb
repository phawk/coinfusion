require "rails_helper"

RSpec.describe "mutation login" do
  it "authenticates the account returning a token" do
    result = CoinfusionSchema.execute(login_query, variables: {
      email: "test@example.com",
      password: "hunter2"
    })
    expect(result.dig("data", "login", "token")).not_to be_blank
  end

  it "returns an error when authentication fails" do
    result = CoinfusionSchema.execute(login_query, variables: {
      email: "test@example.com",
      password: "bad"
    })
    expect(result["data"]).to be_nil
    expect(result["errors"].first["message"]).to eq("Invalid email or password")
  end

  def login_query
    <<~GQL
      mutation Login($email: String!, $password: String!) {
        login(
          input: {
            email: $email
            password: $password
          }
        ) {
          token
        }
      }
    GQL
  end
end
