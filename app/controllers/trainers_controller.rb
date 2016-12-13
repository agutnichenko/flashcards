class TrainersController < ApplicationController

  before_filter :find_card, only: [:review]

  def review
    if @card_translation.translated_text == params[:translated_text]
      redirect_to root_url, notice: 'перевод правильный'
      #p gets.chomp
      p @card_translation.translated_text
    else
      redirect_to cards_url, notice: 'перевод неправильный'
      #p gets.chomp
    end
  end

  private

  def find_card
    @card_translation = Card.find(params[:id])
  end

end
