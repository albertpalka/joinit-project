module NoFluffJobs
  class ParsedOffer < ApplicationRecord
    validates :body, presence: true

    belongs_to :raw_datum
  end
end
