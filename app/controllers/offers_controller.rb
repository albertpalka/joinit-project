class OffersController < ApplicationController

  def index
    if params[:title]
      @offers = Offer.order('RANDOM()')
                     .search_full_text(params[:title])
                     .paginate(page: params[:page], per_page: 40)
    else
      @offers = Offer.all
                     .order('RANDOM()')
                     .paginate(page: params[:page], per_page: 40)
    end
  end

  private

  def offer_params
    params.require(:offers).permit(:title)
  end
end
