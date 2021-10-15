require 'rails_helper'

RSpec.describe "Creatures", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/creatures"
      expect(response).to have_http_status(:ok)
    end

    it "displays a created creatures name" do
      creature = create(:creature)
      creature2 = create(:creature, name: "Goblin")
      get '/creatures'
      expect(response.body).to include(creature.name)
      expect(response.body).to include(creature2.name)
    end

  end



end
