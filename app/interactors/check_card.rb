class CheckCard
  include Interactor

  def call
    @card_translation = context.user.cards.find(context.params[:id])
    if @card_translation.original_text == context.params[:original_text]
      @card_translation.review_date = 3.days.from_now
      result = @card_translation.save
      context.result = result
      context.notice = 'true answer'
    else
      context.notice = 'false answer'
    end
  end

end
