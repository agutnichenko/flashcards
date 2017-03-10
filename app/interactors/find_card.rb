class FindCard
  include Interactor

  def find
    @card_translation = current_user.cards.find(params[:id])
  end
end