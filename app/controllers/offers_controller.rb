class OffersController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @offers = pagy(JustJoinIt::ParsedOffer.all)
  end
end
