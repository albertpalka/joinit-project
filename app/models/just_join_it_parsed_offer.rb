class JustJoinItParsedOffer < ApplicationRecord
  belongs_to :just_join_it_raw_offer

  validates :body, presence: true
end
