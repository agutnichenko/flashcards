class CheckCard
  include Interactor
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
    interval = context.user.cards.find(context.user[:interval])
    repeat = context.user.cards.find(context.user[:repeat])
    efactor = context.user.cards.find(context.user[:efactor])
    attempt = context.user.cards.find(context.user[:attempt])
    distance = context.user.cards.find(context.user[:distance])
    sm_hash = SuperMemo.algorithm(interval, repeat, efactor, attempt, distance, 1)
    @card_translation = context.user.cards.find(context.params[:id])
    if answers_equal?(@card_translation.original_text, context.params[:original_text])
      sm_hash.merge!({review_date: Time.now + interval.to_i.days, attempt: 1})
      update(sm_hash)
      {distance: distance}
      save
    else
      sm_hash.merge!({attempt: [attempt + 1, 5].min})
      update(sm_hash)
      {distance: distance}
    end
  end

  def answers_equal?(original, version)
    distance = DamerauLevenshtein.distance(original, version)
    length = original.size
    relation = (distance / length.to_f)
    relation <= ALLOWED_LEVEL
  end
end
