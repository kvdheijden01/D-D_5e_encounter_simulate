class AttackplayersController < ApplicationController
    def show
        @attackplayer = Attackplayer.find(params[:id])
    end
    
    def new
        @attackplayer = Attackplayer.new
    end
    
    def create
        @player = Player.find(params[:id])
        @attackplayer = Attackplayer.new(attackplayer_params)
        @player.attackplayers.push(@attackplayer)
    
        if @player.save
          redirect_to @player
        else
          render :new
        end
    end
    
    def edit
        @attackplayer = Attackplayer.find(params[:id])
    end
    
    def update
        @attackplayer = Attackplayer.find(params[:id])
    
        if @attackplayer.update(attackplayer_params)
          redirect_to @attackplayer
        else
          render :edit
        end
    end
    
    def destroy
        @attackplayer =Attackplayer.find(params[:id])
        @attackplayer.destroy
    
        redirect_to @player
    end
    
    def add_attack
        @attackplayer =Attackplayer.find(params[:id])
    end
    
    private
        def attackplayer_params
          params.require(:attackplayer).permit(:name, :ability_mod, :dmg)
        end
    
    end
