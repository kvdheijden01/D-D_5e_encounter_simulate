class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def show
    @creature = Creature.find(params[:id])
  end

  def new
    @creature = Creature.new
  end

  def create
    @creature = Creature.new(creature_params)

    if @creature.save
      redirect_to @creature
    else
      render :new
    end
  end

  private
    def creature_params
      params.require(:creature).permit(:name)
    end

end
