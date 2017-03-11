class TrainersController < ApplicationController
  skip_before_action :require_login

    def review
      result = CheckCard.call(params: card_params, user: current_user)
      if result.success?
        redirect_to root_url, notice: 'перевод правильный'
      else
        redirect_to root_url, notice: 'перевод неправильный'
      end
    end

  def card_params
    params.require(:card).permit(:card_params)
  end

end
