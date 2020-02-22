module NoFluffJobs
  # Fetches Raw Data from main offers page. Example: https://nofluffjobs.com/api/search/posting?region=pl
  class FetchRawData
    LINK = 'https://nofluffjobs.com/api/search/posting?region=pl'
    MODEL = NoFluffJobs::RawDatum

    def call
      data = Faraday.get LINK
      MODEL.create!(body: data.body)
    end
  end
end
