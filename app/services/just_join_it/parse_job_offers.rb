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
      json_job_offers = job_offers.map { |o| JSON.parse(o) }
      json_job_offers.each do |offer|
        RAW_DATA_MODEL.parsed_offers.create!(title: offer['title'],
                                             city: offer['city'],
                                             company_name: offer['company_name'],
                                             company_url: offer['company_url'],
                                             offer_url: "https://justjoin.it/offers/#{offer['id']}",
                                             salary_from: offer['salary_from'].to_i,
                                             salary_to: offer['salary_to'].to_i,
                                             skills: offer['skills'].map { |s| s['name'] }.join(', '),
                                             marker_icon: offer['marker_icon'])
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
