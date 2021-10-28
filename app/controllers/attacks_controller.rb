class AttacksController < ApplicationController

  def show
    @attack = Attack.find(params[:id])
  end

  def new
    @attack = Attack.new
  end

  def create
    @creaturetype = Creaturetype.find(params[:id])
    @attack = Attack.new(attack_params)
    @creaturetype.attacks.push(@attack)

    if @creaturetype.save
      redirect_to @creaturetype
    else
      render :new
    end
  end

  def edit
    @attack = Attack.find(params[:id])
  end

  def update
    @attack = Attack.find(params[:id])

    if @attack.update(attack_params)
      redirect_to @attack
    else
      render :edit
    end
  end

  def destroy
    @attack =Attack.find(params[:id])
    @attack.destroy

    redirect_to @creaturetype
  end

  def add_attack
    @attack =Attack.find(params[:id])
  end

  private
    def attack_params
      params.require(:attack).permit(:name, :ability_mod, :dmg, :ability_modifier_dmg)
    end

end
