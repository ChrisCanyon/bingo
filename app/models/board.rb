class Board < ApplicationRecord
  after_create :generate_board

  def generate_board
    25.times do
      beers << { beer: 'beer1', drank: false }
    end
    beers[12] = { beer: 'Get on the bus', drank: true}
    save
  end
end
