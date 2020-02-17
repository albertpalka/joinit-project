# frozen_string_literal: true

# Fetches specific jobs offers and pushes them as array with strings
# to RawOffers model
class FetchRawOffers
  def initialize(raw_data_model)
    @raw_data_model = raw_data_model
  end

  def call
    raw_data_body = @raw_data_model.last.body
    parsed_data = parse(raw_data_body)
    offers_ids = fetch_offers_ids(parsed_data)
    jobs_array = create_offers_array(offers_ids)
    @raw_data_model.last.just_join_it_raw_offers.create!(body: jobs_array.to_s)
  end

  private

  def parse(data)
    JSON.parse(data)
  end

  def fetch_offers_ids(offers_json)
    offers_json.map { |o| o['id'] }
  end

  def create_offers_array(job_offers_ids)
    arr = []
    job_offers_ids.each do |id|
      offer = Faraday.get "https://justjoin.it/api/offers/#{id}"
      arr << offer.body
    end

    arr
  end
end
