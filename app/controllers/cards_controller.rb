class CardsController < ApplicationController

  def authenticate card, token
    if token && token.authenticate(params[:email]) && token.card == card
      session[:card_id] = card.id
      return true
    else
      return false
    end
  end

  # POST /showcase/1 for Auth
  # GET /showcase/1
  def showcase
    session[:card_id] = nil if params[:destroy]
    # require 'pry'
    # binding.pry
    @card = Card.find(params[:id])
    # Public Cards
    if @card.is_public?
      respond_to do |format|
        format.html # show.html.erb
      end
    else

      # Private Cards
      if session[:card_id] == @card.id
        respond_to do |format|
          format.html # show.html.erb
        end
        return
      end
      render text: 'Private Card' and return if !params[:code]
      token = Token.find_by_code(params[:code])
      render text: 'Invalid Code' and return if !token || token.card != @card
      if !params[:email]
        render 'cards/auth', params: {code: params[:code]}
      elsif authenticate(@card, token)
        redirect_to @card
      else
        render text: 'Not Authorized'
      end
    end
  end

  # GET /card/1
  # GET /card/1.json
  def show
    @card = Card.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card.to_custom_json }
    end
  end

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards }
    end
  end

  # GET /cards/new
  # GET /cards/new.json
  def new
    @card = Card.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(params[:card])

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render json: @card, status: :created, location: @card }
      else
        format.html { render action: "new" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.json
  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { head :no_content }
    end
  end
end
