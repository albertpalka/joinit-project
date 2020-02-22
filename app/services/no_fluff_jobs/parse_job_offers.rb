module NoFluffJobs
  class ParseJobOffers
    MODEL = NoFluffJobs::RawDatum.last

    def call
      offers_body = MODEL.body
      parsed_offers = parse(offers_body)
      offers_ids = fetch_offers_ids(parsed_offers)
      jobs_details = fetch_jobs_details(offers_ids)
      jobs_details.each do |offer|
        MODEL.parsed_offers.create!(body: offer)
      end
    end

    private

    def parse(body)
      JSON.parse(body)
    end

    def fetch_offers_ids(offers)
      offers['postings'].map { |o| o['id'] }
    end

    def fetch_jobs_details(offers_ids)
      offers_ids.map do |id|
        offer = Faraday.get "https://nofluffjobs.com/api/posting/#{id}"
        offer.body
        sleep 1
      end
    end
  end
end
