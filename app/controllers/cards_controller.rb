class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  private

 def sleep_params
   params.require(:card).permit(:original_text, :translated_text, :review_date)
 end


end
