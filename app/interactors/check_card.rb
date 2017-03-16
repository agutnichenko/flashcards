class CheckCard
  include Interactor

  def call
    @card_translation = context.user.cards.find(context.params[:id])
    if @card_translation.original_text == context.params[:original_text]
      correct_answer
    else
      incorrect_answer
    end
    save
  end

  def correct_answer
    context.notice = 'correct_answer'
    @card_translation.counter_correct += @card_translation.counter_correct
    update_review_date_correct
  end

  def incorrect_answer
    context.notice = 'incorrect_answer'
    @card_translation.counter_incorrect += @card_translation.counter_incorrect
    update_review_date_incorrect
  end

  def update_review_date_correct
    case @card_translation.counter_correct
      when '1'
        @card_translation.review_date = 12.hours.from_now
      when '2'
        @card_translation.review_date = 3.days.from_now
      when '3'
        @card_translation.review_date = 7.days.from_now
      when '4'
        @card_translation.review_date = 14.days.from_now
      when '5'
        @card_translation.review_date = 1.month.from_now
      else
        p 'nothing'
    end
  end

  def update_review_date_incorrect
    case @card_translation.counter_incorrect
      when '1'
        @card_translation.review_date = 12.hours.from_now
      when '2'
        @card_translation.review_date = 3.days.from_now
      when '3'
        @card_translation.review_date = Time.now
      else
        p 'nothing'
    end
  end

  def save
    result = @card_translation.save
    context.result = result
  end

end