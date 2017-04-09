require 'damerau-levenshtein'
class TrainersController < ApplicationController
  skip_before_action :require_login

  def review
    result = CheckCard.call(params: card_params, user: current_user)
    respond_to do |format|
      @notice = result.notice
      format.html { redirect_to :back, notice: @notice }
      format.js
    end
  end

  def card_params
    params.permit(:original_text, :id)
  end

end
