class EncountersController < ApplicationController
  def show
    @encounters = Encounter.find(params[:id])
  end

  def start
  end

  def new
    @encounter = Encounter.new
    enemy = Enemy.new
    @encounter.enemy = enemy
    if @encounter.save
      redirect_to @encounter
    else
      render :start
    end
  end

  def add
    @encounters = Encounter.find(params[:id])
    @creatures = Creature.all
  end

  def add_creature
    @encounters = Encounter.find(params[:id])
    @encounters.enemy.creatures.push(Creature.find(params[:creature_id]))
  end

end
