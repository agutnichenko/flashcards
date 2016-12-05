class HomeController < ApplicationController

  def index
    count = Card.count
    random_offset = rand(count)
    @random_card = Card.offset(random_offset).first
  end

  def check_translation

  end

end
