module BulldogJobs
  class RawDatum < ApplicationRecord
    has_many :parsed_offers
    validates :body, presence: true
  end
end
