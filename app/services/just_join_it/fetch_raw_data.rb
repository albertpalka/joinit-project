# frozen_string_literal: true

module JustJoinIt
  # Fetches Raw Data from main offers page. Example: https://justjoin.it/api/offers/
  class FetchRawData
    LINK = 'https://justjoin.it/api/offers/'
    MODEL = JustJoinIt::RawDatum

    def call
      data = Faraday.get LINK
      MODEL.create!(body: data.body)
    end
  end
end
