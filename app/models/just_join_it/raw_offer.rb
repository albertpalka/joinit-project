module JustJoinIt
  class RawOffer < ApplicationRecord
    belongs_to :just_join_it_raw_data

    validates :body, presence: true
  end
end
