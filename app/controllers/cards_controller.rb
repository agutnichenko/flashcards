class CardsController < ApplicationController

  def cards
    @cards = Card.all
    render text: @cards.map {|x|
      p x.original_text, x.translated_text, x.review_date
    }.join("</br>")
  end

  def show

  end

  def new

  end

  def edit

  end

  def destroy

  end
end
