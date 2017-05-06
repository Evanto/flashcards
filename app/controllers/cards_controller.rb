class CardsController < ApplicationController

  # before show/edit/update/destriy actions find a particular card
  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.new(card_params)

      if @card.save!
       redirect_to cards_path
      else
       render :new, notice: "Эй!"
      end
  end

  def update
     @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
    end
  end

  def edit
  end

  def find_card
    @card = Card.find(params[:id])
  end


  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to cards_path
  end


  private

  def card_params
   params.require(:card).permit(:original_text, :translated_text, :review_date)
  end



end
