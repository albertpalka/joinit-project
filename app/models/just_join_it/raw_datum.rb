module JustJoinIt
  class RawDatum < ApplicationRecord
    has_many :just_join_it_job_offers

    validates :body, presence: true
  end
end
