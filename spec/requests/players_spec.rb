require 'rails_helper'

RSpec.describe "Players", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/players"
      expect(response).to have_http_status(:ok)
    end

  end

  describe "depiction" do
    it "tests if name is depicted" do
      encounter_setup("Fighter")
      get "/players/1"
      expect(response.body).to include("Fighter")
    end

    it "tests if hp is depicted" do
      encounter_setup("Fighter")
      get "/players/1"
      expect(response.body).to include("HP: 1")
    end

    it "tests if attack is depicted" do
      encounter_setup("Fighter")
      get "/players/1"
      expect(response.body).to include("Fist")
    end

  def encounter_setup(*names)
    enemy = create(:enemy)
    for name in names
      player = create(:player, name: name)
      player.attacks.push(create(:attack))
      enemy.creatures.push(create(:creature, player: player))
    end
      encounter = create(:encounter)
      encounter.enemy = enemy
      encounter.save
  end


end

