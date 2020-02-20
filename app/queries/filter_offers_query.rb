class FilterOffersQuery
  MODEL = JustJoinIt::RawDatum.last

  def initialize(params)
    @params = params
  end

  def call
    relation = MODEL.parsed_offers.all
    relation = by_skills(relation)
    relation = by_city(relation)
    relation
  end

  private

  def by_skills(relation)
    return relation unless @params[:skills].present?
    relation.where(skills: @params[:skills])
  end

  def by_city(relation)
    return relation unless @params[:city].present?
    relation.where(city: @params[:city])
  end
end
