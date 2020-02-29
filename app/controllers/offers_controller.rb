class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  private

  def offer_params
    params.require(:offers).permit(:title)
  end
end
