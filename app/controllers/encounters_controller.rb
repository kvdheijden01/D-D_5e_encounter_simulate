class EncountersController < ApplicationController
  def index
    @creatures = Encounter.first.enemy.creatures
  end
end
