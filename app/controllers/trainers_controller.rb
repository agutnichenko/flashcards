class TrainersController < ApplicationController
  skip_before_action :require_login

    def review
      result = CheckCard.call(params: card_params, user: current_user)
      redirect_to :back, notice: result.notice
    end

  def card_params
    params.permit(:original_text, :id)
  end

end
