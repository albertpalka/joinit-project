# frozen_string_literal: true

LINK = 'https://justjoin.it/api/offers/'
MODEL = JustJoinIt::RawDatum

# Fetches Raw Data from main offers page. Example: https://justjoin.it/api/offers/
class FetchRawData
  def call
    data = Faraday.get LINK
    MODEL.create!(body: data.body)
  end
end
