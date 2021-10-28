class EncountersController < ApplicationController
  def show
    @encounters = Encounter.find(params[:id])
    @encounters.cal_dmg_per_round
    @encounters.enemy.cal_HPpool
    @encounters.party.cal_HPpool
  end

  def start
  end

  def results
    @encounters = Encounter.find(params[:id])
  end

  def new
    @encounter = Encounter.new
    enemy = Enemy.new
    @encounter.enemy = enemy
    party = Party.new
    @encounter.party = party
    if @encounter.save
      redirect_to @encounter
    else
      render :start
    end
  end

  def add_enemy
    @encounters = Encounter.find(params[:id])
    @creaturetypes = Creaturetype.all
  end

  def add_party
    @encounters = Encounter.find(params[:id])
    @players = Player.all
  end

  def add_creature
    @encounters = Encounter.find(params[:id])
    creature = Creature.new
    creature.creaturetype = Creaturetype.find(params[:creaturetypeid])

    @encounters.enemy.creatures.push(creature)

    redirect_to @encounters
  end

  def add_player
    @encounters = Encounter.find(params[:id])
    player = Player.find(params[:playerid])

    @encounters.party.players.push(player)

    redirect_to @encounters
  end

  def simulate
    @encounters = Encounter.find(params[:id])
    @encounters.simulate
    @encounters.enemy.save
    @encounters.party.save

    redirect_to action: 'results', params: { id: @encounters.id}
  end

end
