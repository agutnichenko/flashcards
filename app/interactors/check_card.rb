class CheckCard
  include Interactor

  def call
    @card_translation = context.user.cards.find(context.params[:id])
    if @card_translation.original_text == context.params[:original_text]
      @card_translation.review_date = 3.days.from_now
      result = @card_translation.save
      context.result = result
      notice = 'true answer'
      context.notice = notice
    else
      #context.fail!
      notice = 'false answer'
      context.notice = notice
    end
  end

end
