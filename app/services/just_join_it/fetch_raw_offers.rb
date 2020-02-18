# frozen_string_literal: true

module JustJoinIt
  # Fetches specific jobs offers and pushes them as array with strings
  # to RawOffers model
  class FetchRawOffers
    RAW_DATA_MODEL = JustJoinIt::RawDatum.last

    def call
      raw_data_body = RAW_DATA_MODEL.body
      parsed_data = parse(raw_data_body)
      offers_ids = fetch_offers_ids(parsed_data)
      jobs_array = create_offers_array(offers_ids)
      jobs_array.each do |offer|
        RAW_DATA_MODEL.just_join_it_raw_offer.create!(body: offer)
      end
    end

    private

    def parse(data)
      JSON.parse(data)
    end

    def fetch_offers_ids(offers_json)
      offers_json.map { |o| o['id'] }
    end

    def create_offers_array(job_offers_ids)
      job_offers_ids.map do |id|
        offer = Faraday.get "https://justjoin.it/api/offers/#{id}"
        offer.body
      end
    end
  end
end
