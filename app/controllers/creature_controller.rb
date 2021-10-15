class CreatureController < ApplicationController
  def index
    @creatures = Creature.all
  end
end
