require 'rails_helper'

RSpec.describe "Creaturetypes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/creaturetypes"
      expect(response).to have_http_status(:ok)
    end

    it "displays a created creaturetypes name" do
      creaturetype = create(:creaturetype)
      creaturetype2 = create(:creaturetype, name: "Goblin")
      get '/creaturetypes'
      expect(response.body).to include(creaturetype.name)
      expect(response.body).to include(creaturetype2.name)
    end

  end



end
