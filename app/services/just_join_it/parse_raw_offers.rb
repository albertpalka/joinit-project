# frozen_string_literal: true

# Parses string of Raw Offers and adds them to ParsedOffers table
class ParseRawOffers
  def initialize(raw_offers_model)
    @raw_offers_model = raw_offers_model
  end

  def call
    body = fetch_raw_body(@raw_offers_model)
    array_of_jsons = change_raw_body_to_array(body)
    parse_offers(array_of_jsons)
  end

  private

  def fetch_raw_body(raw_model)
    raw_model.last.body
  end

  def change_raw_body_to_array(raw_body)
    JSON.parse(raw_body).map { |offer| JSON.parse(offer) }
  end

  def parse_offers(array_of_jsons)
    array_of_jsons.each do |offer_attr|
      @raw_offers_model.last.just_join_it_parsed_offer.create(title: offer_attr['title'],
                                                              city: offer_attr['city'],
                                                              company_name: offer_attr['company_name'],
                                                              company_url: offer_attr['company_url'],
                                                              offer_url: "https://justjoin.it/offers/#{offer_attr['id']}",
                                                              salary_from: offer_attr['salary_from'].to_i,
                                                              salary_to: offer_attr['salary_to'].to_i,
                                                              skills: offer_attr['skills'].map { |s| s['name'] }
                                                                                          .join(', '))
    end
  end
end
