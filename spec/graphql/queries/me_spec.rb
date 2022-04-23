require "rails_helper"

RSpec.describe "query me" do
  let(:account) { accounts(:test) }

  it "returns info about the current logged in account" do
    query = <<~GQL
      query {
        me {
          id
          name
          email
        }
      }
    GQL

    result = CoinfusionSchema.execute(query, context: { current_account: account })

    expect(result.dig("data", "me", "id")).to eq(String(account.id))
    expect(result.dig("data", "me", "name")).to eq("Test Account")
    expect(result.dig("data", "me", "email")).to eq("test@example.com")
  end
end
