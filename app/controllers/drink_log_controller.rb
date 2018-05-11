class DrinkLogController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]

  def index
    @drink_log = Drank.where("created_at >= :date", date: DateTime.new.beginning_of_day)
    render partial: 'drink_log'
  end
end
