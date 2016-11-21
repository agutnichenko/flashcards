class CardsController < ApplicationController;

  def index
    @cards = Card.all
  end

  def show
    unless @card = Card.find(params[:id])
    #unless @card = Card.where(id: params[:id]).first
      render text: 'Page not found', status: 404
    end
  end

  def new
    @card = Card.new
  end

  def edit
    params.permit!
    @card = Card.find(params[:id])
  end

  def create
    params.permit!
    @card = Card.create(params[:card])
    if @card.errors.empty?
      redirect_to card_path(@card), notice: 'card is created!'
    else
      render 'new'
    end
  end

  def update
    params.permit!
    @card = Card.find(params[:id])
    @card.update_attributes(params[:card])
    if @card.errors.empty?
      redirect_to card_path(@card)
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to action: "index"
  end

end
