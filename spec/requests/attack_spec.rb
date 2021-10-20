require 'rails_helper'

RSpec.describe "Attacks", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/attack/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/attack/create"
      expect(response).to have_http_status(:success)
    end
  end

end
