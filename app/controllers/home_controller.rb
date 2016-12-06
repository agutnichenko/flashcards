class HomeController < ApplicationController

  def index
    @card = Card.get_random
  end

  def check_translation

  end

end
