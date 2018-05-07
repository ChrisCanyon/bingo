class LoginController < ApplicationController
  def index

  end

  def create
    board = Board.find_or_create_by(nickname: params[:board][:nickname])
    redirect_to boards_path(id: board.id, nickname: board.nickname)
  end

  def new
    @board = Board.new
  end
end
