require 'rails_helper'

RSpec.describe "Encounters", type: :request do
  describe "GET /show" do

    it "returns http success" do
      encounter_setup("goblin", "imp")
      get "/encounters/1"
      expect(response).to have_http_status(:success)
    end

    it "displays enemy creatures" do
      encounter_setup("goblin", "imp")
      get "/encounters/1"
      expect(response.body).to include("goblin")
      expect(response.body).to include("imp")
    end

  end

  def encounter_setup(*names)
    enemy = create(:enemy)
    for name in names
      creaturetype = create(:creaturetype, name: name)
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))
    end
      encounter = create(:encounter)
      encounter.enemy = enemy
      encounter.save
  end

end
