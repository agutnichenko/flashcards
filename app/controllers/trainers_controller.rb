class TrainersController < ApplicationController

  before_filter :find_card, only: [:edit, :update]

  def index; end

  def edit; end

  def update
    params.permit!
    if @card_translation.translated_text == params[:translated_text]
      redirect_to root_url, notice: 'перевод правильный'
    else
      redirect_to root_url, notice: 'перевод неправильный'
    end
  end

  private

  def find_card
    @card_translation = Card.find(params[:id])
  end

end
