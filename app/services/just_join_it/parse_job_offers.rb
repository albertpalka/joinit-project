# frozen_string_literal: true

module JustJoinIt
  # Parses string of Raw Offers and adds them to ParsedOffers table
  class ParseJobOffers
    RAW_DATA_MODEL = JustJoinIt::RawDatum.last

    def call
      body = RAW_DATA_MODEL.body
      parsed_body = parse(body)
      offers_ids = fetch_offers_ids(parsed_body)
      job_offers = create_offers_array(offers_ids)
      RAW_DATA_MODEL.parsed_offers.transaction do
        job_offers.each do |offer|
          parsed_offer = JSON.parse(offer)
          RAW_DATA_MODEL.parsed_offers.create!(body: parsed_offer)
        end
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
