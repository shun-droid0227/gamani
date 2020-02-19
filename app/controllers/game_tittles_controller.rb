class GameTittlesController < ApplicationController

  def index
    @game_tittles = GameTittle.all
    @new_tittle =GameTittle.new
  end

  def create
    game_tittle = GameTittle.new(game_tittle_params)
    game_tittle.save
    redirect_to game_tittles_path
  end

  def destroy

  end

  def game_tittle_params
    params.require(:game_tittle).permit(:name,:game_genle_id)
  end

end
