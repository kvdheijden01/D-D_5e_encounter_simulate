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
    @creaturetypes = Creaturetype.all
  end

  def add_creature
    @encounters = Encounter.find(params[:id])
    creature = Creature.new
    creature.creaturetype = Creaturetype.find(params[:creaturetypeid])

    @encounters.enemy.creatures.push(creature)

    redirect_to @encounters
  end

end