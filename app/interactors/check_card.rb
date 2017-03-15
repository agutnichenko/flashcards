class CheckCard
  include Interactor

  def call
    @card_translation = context.user.cards.find(context.params[:id])
    if @card_translation.original_text == context.params[:original_text] &&
    @card_translation.counter == 0
      @card_translation.review_date = 12.hours.from_now
      @card_translation.counter += @card_translation.counter
      context.notice = 'true first attempt. +12 hours'
      save
    elsif @card_translation.original_text != context.params[:original_text] &&
    @card_translation.counter == 0
      @card_translation.counter = 10
      context.notice = 'false first attempt. +0 hours'
      save
    elsif @card_translation.original_text == context.params[:original_text] &&
    @card_translation.counter == 1
      @card_translation.review_date = 3.days.from_now
      @card_translation.counter += @card_translation.counter
      context.notice = 'true second attempt. +3 days'
      save
    elsif @card_translation.original_text != context.params[:original_text] &&
        @card_translation.counter == 10
      @card_translation.counter = 11
      context.notice = 'false second attempt. +0 hours'
      save
    elsif @card_translation.original_text == context.params[:original_text] &&
        @card_translation.counter == 2
      @card_translation.review_date = 7.days.from_now
      @card_translation.counter += @card_translation.counter
      context.notice = 'true third attempt. +7 days'
      save
    elsif @card_translation.original_text != context.params[:original_text] &&
        @card_translation.counter == 11
      @card_translation.counter = 0
      context.notice = 'false third attempt. start from the beginning :('
      save
    elsif @card_translation.original_text == context.params[:original_text] &&
        @card_translation.counter == 3
      @card_translation.review_date = 14.days.from_now
      @card_translation.counter += @card_translation.counter
      context.notice = 'true fourth attempt. +14 days'
      save
    elsif @card_translation.original_text == context.params[:original_text] &&
        @card_translation.counter == 4
      @card_translation.review_date = 1.month.from_now
      @card_translation.counter += @card_translation.counter
      'true fifth attempt. +1 month'
      save
    else
      context.notice = 'you had translated all the cards 5 times'
    end
  end

  def save
    result = @card_translation.save
    context.result = result
  end

end
