class LoginController < ApplicationController
  def create
    board = Board.find_or_create_by(nickname: params[:board][:nickname])
    redirect_to boards_path(id: board.id, nickname: board.nickname)
  end

  def new
    @board = Board.new
    @drink_log = Drank.all
    @boards = leader_board
  end

  def leader_board
    Board.all.sort {|x,y| y.distance <=> x.distance }
  end
end
