class JustJoinItRawOffer < ApplicationRecord
  belongs_to :just_join_it_raw_data
  has_many :just_join_it_parsed_offers

  validates :body, presence: true
end
