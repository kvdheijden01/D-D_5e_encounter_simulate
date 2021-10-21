require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "validation" do
    it "enemy - creature model relations can retrieve name" do
      player = create(:player)
      party = create(:party)
      party.players.push(player)
      expect(party.players.first.name).to eq(player.name)
    end

  end
end
