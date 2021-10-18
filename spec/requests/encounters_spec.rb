require 'rails_helper'

RSpec.describe "Encounters", type: :request do
  describe "GET /index" do

    it "returns http success" do
      get "/encounters/index"
      expect(response).to have_http_status(:success)
    end

    it "displays enemy creatures" do
      goblin = create(:creature, name: "goblin")
      imp = create(:creature, name: "imp")
      enemy = create(:enemy)
      enemy.creatures.push(goblin)
      enemy.creatures.push(imp)
      encounter = create(:encounter)
      encounter.enemy = enemy
      get "/encounters/index"
      expect(response.body).to include(goblin.name)
      expect(response.body).to include(imp.name)
    end

  end

end
