class LeaderBoardController < ApplicationController
  def index
    @boards = leader_board
    render partial: 'leader_board'
  end

  def leader_board
    Board.where("created_at >= :date", date: DateTime.new.beginning_of_day).sort {|x,y| y.distance <=> x.distance }
  end
end
