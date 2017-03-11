class TrainersController < ApplicationController
  skip_before_action :require_login

    def review
      result = CheckCard.call(params: Card.card_params, user: current_user)
      redirect_to :back, notice: result.notice
    end

end
