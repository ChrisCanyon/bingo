class BoardsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

  def show
    @board = Board.find_by(nickname: params[:nickname], id: params[:id])
    @drink_log = Drank.all
  end

  def update
    @board = Board.find_by(id: params[:id])
    beer_index = params[:beer_index].to_i
    to_update = @board.beers[beer_index]
    to_update['drank'] = !to_update['drank']
    @board.save
    drank = Drank.find_or_create_by(beer: to_update['beer'], drinker: @board.nickname)
    drank.destroy unless to_update['drank']
  end
end
