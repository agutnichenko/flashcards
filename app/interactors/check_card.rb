class CheckCard
  include Interactor
  require 'supermemo'
  #
  # def call
  #   @card_translation = context.user.cards.find(context.params[:id])
  #   if answers_equal?(@card_translation.original_text, context.params[:original_text])
  #     correct_answer
  #     save
  #   else
  #     incorrect_answer
  #   end
  # end
  #
  # def correct_answer
  #   context.notice = 'correct_answer'
  #   @card_translation.update(counter_correct: @card_translation.counter_correct + 1)
  #   update_review_date_correct
  # end
  #
  # def incorrect_answer
  #   context.notice = 'incorrect_answer'
  #   if @card_translation.counter_incorrect == 3
  #     @card_translation.update(counter_incorrect: 0, counter_correct: 0)
  #   else
  #     @card_translation.update(counter_correct: @card_translation.counter_correct + 1)
  #   end
  # end
  #
  # def update_review_date_correct
  #   review_date = case @card_translation.counter_correct
  #                   when 1
  #                     12.hours.from_now
  #                   when 2
  #                     3.days.from_now
  #                   when 3
  #                     7.days.from_now
  #                   when 4
  #                     14.days.from_now
  #                   else
  #                     1.month.from_now
  #                 end
  #   @card_translation.review_date = review_date
  # end
  #
  # def save
  #   @card_translation.save
  # end
  #
  # ALLOWED_LEVEL = 0.15
  #
  # def answers_equal?(original, version)
  #   distance = DamerauLevenshtein.distance(original, version)
  #   length = original.size
  #   relation = (distance / length.to_f)
  #   relation <= ALLOWED_LEVEL
  # end

  def call
    card = context.user.cards.find(context.params[:id])
    distance = DamerauLevenshtein.distance(card.original_text, context.params[:original_text])
    sm_hash = SuperMemo.algorithm(card.interval, card.repeat, card.efactor, card.attempt, distance, 1)

    if distance <= 1
      sm_hash.merge!({review_date: Time.now + card.interval.to_i.days, attempt: 1})
      {distance: distance}
      card.save
      context.notice = 'correct_answer'
    else
      sm_hash.merge!({attempt: [card.attempt + 1, 5].min})
      {distance: distance}
      context.notice = 'incorrect_answer'
    end
  end

  #sm_hash.merge!({card.attempt: [card.attempt + 1, 5].min})

  # def answers_equal?(original, version)
  #   @distance = DamerauLevenshtein.distance(original, version)
  #   length = original.size
  #   relation = (@distance / length.to_f)
  #   relation <= ALLOWED_LEVEL
  # end

end
