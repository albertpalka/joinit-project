class OffersController < ApplicationController
  include Pagy::Backend

  def index
    if params[:skills]
      @pagy, @offer = pagy(JustJoinIt::RawDatum.last
                                               .parsed_offers
                                               .search_full_text(params[:skills]))
    elsif params[:city]
      @pagy, @offer = pagy(JustJoinIt::RawDatum.last
                                                .parsed_offers
                                                .search_full_text(params[:city]))
    elsif params[:skills] && params[:city]
      @pagy, @offer = pagy(JustJoinIt::RawDatum.last
                                               .parsed_offers
                                               .search_full_text(params[:skills, :city]))
    else
      @pagy, @offer = pagy(JustJoinIt::RawDatum.last.parsed_offers)
    end
  end

  def skills
    @skills = JustJoinIt::ParsedOffer.all
                                     .pluck(:skills)
                                     .map{ |s| s.split(',') }
                                     .flatten
                                     .collect(&:squish)
                                     .uniq
                                     .sort
  end

  private

  def offer_params
    params.require(:parsed_offers).permit(:skills, :city)
  end
end
