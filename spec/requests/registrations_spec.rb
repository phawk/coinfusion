require "rails_helper"

RSpec.describe "Registrations", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/registrations/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /registrations" do
    it "creates accounts for individuals" do
      expect do
        post "/registrations", params: {
          account: {
            name: "Fred",
            email: "fred@example.com",
            password: "fullPassword!",
            date_of_birth: "2000-01-01"
          }
        }
        expect(response).to redirect_to(signup_success_path)
      end.to change(Account, :count).by(1)
      account = Account.last
      expect(account.account_type).to eq("individual")
      expect(account.name).to eq("Fred")
      expect(account.email).to eq("fred@example.com")
      expect(account.date_of_birth).to eq(Date.parse("2000-01-01"))
    end

    it "creates accounts for companies" do
      expect do
        post "/registrations", params: {
          account: {
            account_type: "company",
            name: "Freddies BBQ Ltd",
            company_number: "134483",
            email: "freddiesbbq@example.com",
            password: "fullPassword!"
          }
        }
        expect(response).to redirect_to(signup_success_path)
      end.to change(Account, :count).by(1)
      account = Account.last
      expect(account.account_type).to eq("company")
      expect(account.name).to eq("Freddies BBQ Ltd")
      expect(account.company_number).to eq("134483")
      expect(account.email).to eq("freddiesbbq@example.com")
      expect(account.date_of_birth).to be_nil
    end

    it "displays errors when validation fails" do
      post "/registrations", params: {
        account: {
          name: "Fred",
          email: "fred@example.com",
          password: "short",
          date_of_birth: "2000-01-01"
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to include("Password is too short")
    end
  end
end
