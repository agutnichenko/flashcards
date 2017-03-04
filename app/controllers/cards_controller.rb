class CardsController < ApplicationController;

  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = current_user.cards
    @card = current_user.cards.get_random
  end

  def show
    unless @card
      render text: 'Page not found', status: 404
    end
  end

  def new
    @card = current_user.cards.new
  end

  def edit; end

  def create
    @card = current_user.cards.create(card_params)
    if  @card.valid?
      redirect_to card_path(@card), notice: 'card is created!'
    else
      render 'new'
    end
  end

  def update
    @card.update_attributes(card_params)
    if @card.valid?
      redirect_to card_path(@card)
    else
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_url
  end

  private

  def find_card
    @card = current_user.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :avatar, :deck_id)
  end

end

