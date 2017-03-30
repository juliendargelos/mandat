class StaticPagesController < ApplicationController
  def home
    @first_card = Card.where(id: Card.ids.sample).take
    session[:budget_gauge] = 50
    session[:employers_gauge] = 50
    session[:population_gauge] = 50
    session[:played_card] = []
    session[:score] = 0
  end
  def gameover

  end
end
