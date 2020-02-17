module JustJoinIt
  class RawOffer < ApplicationRecord
    belongs_to :just_join_it_raw_datum
    has_many :just_join_it_parsed_offers

    validates :body, presence: true
  end
end
