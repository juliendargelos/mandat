class CardsController < ApplicationController
  before_action :set_card, only: [:show,:play, :edit, :update, :destroy,:oui,:non]
  before_action :set_cards, only: [:index,:oui,:non]
  # GET /cards
  # GET /cards.json
  def index
  end

  def oui
    @cards_ids = @cards.map{|card| card.id}
      session[:budget_gauge] += @card.budget_oui
      session[:employers_gauge] += @card.employers_oui
      session[:population_gauge] += @card.population_oui

      if session[:played_card].count == @cards.count
        session[:played_card] = []
      end
      if session[:budget_gauge] >= 100
        session[:budget_gauge] = 100
      end
      if session[:population_gauge] >= 100
        session[:population_gauge] = 100
      end
      if session[:employers_gauge] >= 100
        session[:employers_gauge] = 100
      end

      if session[:played_card].count == @cards.count || (session[:budget_gauge] <= 0 || session[:employers_gauge] <= 0 || session[:population_gauge] <= 0)
        redirect_to  "/gameover"
      else
      redirect_to action: "show", id: (@cards_ids - session[:played_card]).sample
    end
  end
  def non
    @cards_ids = @cards.map{|card| card.id}
      session[:budget_gauge] += @card.budget_non
      session[:employers_gauge] += @card.employers_non
      session[:population_gauge] += @card.population_non
      if session[:played_card].count == @cards.count
        session[:played_card] = []
      end
      if session[:budget_gauge] >= 100
        session[:budget_gauge] = 100
      end
      if session[:population_gauge] >= 100
        session[:population_gauge] = 100
      end
      if session[:employers_gauge] >= 100
        session[:employers_gauge] = 100
      end
      if session[:played_card].count == @cards.count || (session[:budget_gauge] <= 0 || session[:employers_gauge] <= 0 || session[:population_gauge] <= 0)
        redirect_to  "/gameover"
      else
      redirect_to action: "show", id: (@cards_ids - session[:played_card]).sample
    end
  end


  # GET /cards/1
  # GET /cards/1.json
  def show
    session[:played_card] << @card.id
    session[:score] += 1
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    def set_cards
      @cards = Card.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:title,:desc, :budget_oui, :employers_oui, :population_oui,:budget_non, :employers_non, :population_non,:image)
    end
end
