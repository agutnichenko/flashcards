class HomeController < ApplicationController

  def index
    @card = Card.get_random
  end

end
