# frozen_string_literal: true

module NoFluffJobs
  class ParseJobOffers
    MODEL = NoFluffJobs::RawDatum.last

    def call
      offers_body = MODEL.body
      parsed_offers = parse(offers_body)
      offers_ids = fetch_offers_ids(parsed_offers)
      MODEL.parsed_offers.transaction do
        offers_ids.each do |id|
          offer = Faraday.get "https://nofluffjobs.com/api/posting/#{id}"
          parsed_offer = JSON.parse(offer.body)
          MODEL.parsed_offers.create!(body: parsed_offer)
        end
      end
    end

    private

    def parse(body)
      JSON.parse(body)
    end

    def fetch_offers_ids(offers)
      offers['postings'].map { |o| o['id'] }
    end
  end
end
