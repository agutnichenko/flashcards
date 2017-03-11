class CheckCard
  include Interactor

  def self.call(args = {})
    context = args
     @card_translation = context(user.cards.find(card_params[:id]))
     if @card_translation.original_text == context(card_params[:original_text])
      @card_translation.review_date = 3.days.from_now
      result = @card_translation.save
      context.result = result
    else
      context.fail
    end
  end

end
