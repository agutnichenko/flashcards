class CardsController < ApplicationController

  def cards
    @cards = Card.all
    render text: @cards.map {|x|
      p x.Original_text, x.Translated_text, x.Review_date
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
