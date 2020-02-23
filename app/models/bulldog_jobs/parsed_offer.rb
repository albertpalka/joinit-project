module BulldogJobs
  class ParsedOffer < ApplicationRecord
    belongs_to :raw_datum
    validates :body, presence: true
  end
end
