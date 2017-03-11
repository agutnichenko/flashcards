class CheckCard
  include Interactor

  def index
    @card_translation = context.user.cards.find(params[:id])
    if @card_translation.original_text == context.params[:original_text]
      @card_translation.review_date = 3.days.from_now
      @card_translation.save
      redirect_to root_url, notice: 'перевод правильный'
    else
      redirect_to root_url, notice: 'перевод неправильный'
    end
  end
end