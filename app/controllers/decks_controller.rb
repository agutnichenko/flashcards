class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  # GET /decks
  # GET /decks.json
  def index
    @decks = current_user.decks.all
  end

  # GET /decks/1
  # GET /decks/1.json
  # def show
  #   unless @deck
  #     render text: 'deck not found', status: 404
  #   end
  # end

  # GET /decks/new
  def new
    @deck = current_user.decks.new
  end

  # GET /decks/1/edit
  def edit
  end

  # POST /decks
  # POST /decks.json
  def create
    @deck = current_user.decks.create(deck_params)

    respond_to do |format|
      if @deck.save
        format.html { redirect_to @deck, notice: 'Deck was successfully created.' }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url, notice: 'Deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = current_user.decks.find(params[:id])
      redirect_to decks_path
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_params
      params.require(:deck).permit(:name)
    end

end
