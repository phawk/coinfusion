require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "GET /signup_success" do
    it "returns http success" do
      get "/signup_success"
      expect(response).to have_http_status(:success)
    end
  end
end
