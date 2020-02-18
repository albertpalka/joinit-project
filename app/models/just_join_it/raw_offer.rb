module JustJoinIt
  class RawOffer < ApplicationRecord
    belongs_to :raw_datum
    has_many :parsed_offers

    validates :body, presence: true
  end
end
