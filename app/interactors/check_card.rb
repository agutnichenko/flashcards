class CheckCard
  require 'damerau-levenshtein'
  include Interactor

  def call
    @card_translation = context.user.cards.find(context.params[:id])
    size = @card_translation.original_text.length
    if size <= 6 && DamerauLevenshtein.distance(@card_translation.original_text, context.params[:original_text]).to_i <= 1
      correct_answer
      save
    elsif size > 6 && DamerauLevenshtein.distance(@card_translation.original_text, context.params[:original_text]).to_i <= 2
      correct_answer
      save
    else
      incorrect_answer
    end
  end

  def correct_answer
    context.notice = 'correct_answer'
    @card_translation.update(counter_correct: @card_translation.counter_correct + 1)
    update_review_date_correct
  end

  def incorrect_answer
    context.notice = 'incorrect_answer'
    if @card_translation.counter_incorrect == 3
      @card_translation.update(counter_incorrect: 0, counter_correct: 0)
    else
      @card_translation.update(counter_correct: @card_translation.counter_correct + 1)
    end
  end

  def update_review_date_correct
    review_date = case @card_translation.counter_correct
                    when 1
                      12.hours.from_now
                    when 2
                      3.days.from_now
                    when 3
                      7.days.from_now
                    when 4
                      14.days.from_now
                    else
                      1.month.from_now
                  end
    @card_translation.review_date = review_date
  end

  def save
    @card_translation.save
  end

end
