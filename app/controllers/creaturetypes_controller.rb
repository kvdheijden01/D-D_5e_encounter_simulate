class CreaturetypesController < ApplicationController
  def index
    @creaturetypes = Creaturetype.all
  end

  def show
    @creaturetype = Creaturetype.find(params[:id])
  end

  def new
    @creaturetype = Creaturetype.new
  end

  def create
    @creaturetype = Creaturetype.new(creaturetype_params)

    if @creaturetype.save
      redirect_to @creaturetype
    else
      render :new
    end
  end

  def edit
    @creaturetype = Creaturetype.find(params[:id])
  end

  def update
    @creaturetype = Creaturetype.find(params[:id])

    if @creaturetype.update(creaturetype_params)
      redirect_to @creaturetype
    else
      render :edit
    end
  end

  def destroy
    @creaturetype =Creaturetype.find(params[:id])
    @creaturetype.destroy

    redirect_to "creaturetypes#index"
  end

  private
    def creaturetype_params
      params.require(:creaturetype).permit(:name, :HP, :AC, :proficiency, :STR, :DEX, :CON, :INT, :WIS, :CHA)
    end

end
