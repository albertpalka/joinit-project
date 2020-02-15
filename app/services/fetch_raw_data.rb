# frozen_string_literal: true

# Fetches Raw Data from main offers page. Example: https://justjoin.it/api/offers/
class FetchRawData
  def initialize(link, model)
    @link = link
    @model = model
  end

  def call
    data = HTTParty.get("#{@link}")
    @model.create!(body: data.body)
  end
end
