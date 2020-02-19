class GameGenlesController < ApplicationController
  
  def index
    @game_genles = GameGenle.all
    @new_genle = GameGenle.new
  end

  def create
    game_jenle = GameGenle.new(game_genle_params)
    game_jenle.save
    redirect_to game_genles_path
  end

  def destroy

  end

  def game_genle_params
    params.require(:game_genle).permit(:name)
  end

end
