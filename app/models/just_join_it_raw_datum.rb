class JustJoinItRawDatum < ApplicationRecord
  has_many :just_join_it_raw_offers

  validates :body, presence: true
end
