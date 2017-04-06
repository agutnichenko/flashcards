require 'damerau-levenshtein'
class TrainersController < ApplicationController
  skip_before_action :require_login

    # def review
    #   result = CheckCard.call(params: card_params, user: current_user)
    #   redirect_to :back, notice: result.notice
    # end

  @card_translation = context.user.cards.find(context.params[:id])

  def review(@card_translation)
    distance = Levenshtein.distance(full_downcase(translated_text),
                                    full_downcase(user_translation))

    sm_hash = SuperMemo.algorithm(interval, repeat, efactor, attempt, distance, 1)

    if distance <= 1
      sm_hash.merge!({ review_date: Time.now + interval.to_i.days, attempt: 1 })
      update(sm_hash)
      { state: true, distance: distance }
    else
      sm_hash.merge!({ attempt: [attempt + 1, 5].min })
      update(sm_hash)
      { state: false, distance: distance }
    end
  end

  def card_params
    params.permit(:original_text, :id)
  end

end
