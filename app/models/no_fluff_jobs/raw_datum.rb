module NoFluffJobs
  class RawDatum < ApplicationRecord
    validates :body, presence: true
  end
end
