module JustJoinIt
  class RawDatum < ApplicationRecord
    has_many :raw_offers

    validates :body, presence: true
  end
end
