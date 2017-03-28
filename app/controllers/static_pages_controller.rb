class StaticPagesController < ApplicationController
  def home
    @cards = Card.all
    @first_card = Card.find_by_title("start")
    session[:budget_gauge] = 50
    session[:employers_gauge] = 50
    session[:population_gauge] = 50
    session[:played_card] = []
    session[:score] = 0
  end
  def gameover

  end
end
