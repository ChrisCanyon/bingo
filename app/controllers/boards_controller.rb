class BoardsController < ApplicationController
  def show
    @board = Board.find_by(nickname: params[:nickname], id: params[:id])
  end
end
