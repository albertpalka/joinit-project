class JustJoinItRawOffer < ApplicationRecord
  belongs_to :just_join_it_raw_datum
  has_many :just_join_it_parsed_offer

  validates :body, presence: true
end
