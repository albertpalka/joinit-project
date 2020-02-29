class OffersController < ApplicationController

  def index
    if params[:title]
      @offers = Offer.with_salary
                     .order('RANDOM()')
                     .search_full_text(params[:title])
                     .paginate(page: params[:page], per_page: 40)
    elsif params[:city]
      @offers = Offer.with_salary
                     .order('RANDOM()')
                     .search_full_text(params[:city])
                     .paginate(page: params[:page], per_page: 40)
    elsif params[:title] && params[:city]
      @offers = Offer.with_salary
                     .order('RANDOM()')
                     .search_full_text(params[:title, :city])
                     .paginate(page: params[:page], per_page: 40)
    else
      @offers = Offer.with_salary
                     .order('RANDOM()')
                     .paginate(page: params[:page], per_page: 40)
    end
  end

  private

  def offer_params
    params.require(:offers).permit(:title, :city)
  end
end
