class StaticPagesController < ApplicationController
  def home
    @first_card = Card.where(id: Card.ids.sample).take
  end
  def gameover

  end
end
