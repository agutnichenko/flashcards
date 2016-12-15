class TrainersController < ApplicationController

  before_filter :find_card, only: [:review]

  def review
    if @card_translation.original_text == params[:original_text]
      @card_translation.review_date = 3.days.from_now
      @card_translation.save
      redirect_to root_url, notice: 'перевод правильный'
    else
      redirect_to cards_url, notice: 'перевод неправильный'
      @card_translation.save
    end
  end

  private

  def find_card
    @card_translation = Card.find(params[:id])
  end

end
