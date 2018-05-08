class BoardsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

  def show
    @board = Board.find_by(nickname: params[:nickname], id: params[:id])
  end

  def update
    p 'updating'
    p params
    @board = Board.find_by(id: params[:id])
    beer_index = params[:beer].to_i
    to_update = @board.beers[beer_index]
    to_update['drank'] = !to_update['drank']
    @board.save
  end
end
