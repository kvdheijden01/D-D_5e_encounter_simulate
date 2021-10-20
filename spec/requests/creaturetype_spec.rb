require 'rails_helper'

RSpec.describe "Creaturetypes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/creaturetypes"
      expect(response).to have_http_status(:ok)
    end

  end

  describe "depiction" do
    it "tests if name is depicted" do
      encounter_setup("Goblin")
      get "/creaturetypes/1"
      expect(response.body).to include("Goblin")
    end

    it "tests if hp is depicted" do
      encounter_setup("Goblin")
      get "/creaturetypes/1"
      expect(response.body).to include("HP: 1")
    end

    it "tests if attack is depicted" do
      encounter_setup("Goblin")
      get "/creaturetypes/1"
      expect(response.body).to include("Fist")
    end
  end

  def encounter_setup(*names)
    enemy = create(:enemy)
    for name in names
      creaturetype = create(:creaturetype, name: name)
      creaturetype.attacks.push(create(:attack))
      enemy.creatures.push(create(:creature, creaturetype: creaturetype))
    end
      encounter = create(:encounter)
      encounter.enemy = enemy
      encounter.save
  end


end
