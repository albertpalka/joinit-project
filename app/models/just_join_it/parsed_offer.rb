# frozen_string_literal: true

module JustJoinIt
  class ParsedOffer < ApplicationRecord
    belongs_to :raw_datum

    include PgSearch::Model	    validates :body, presence: true
    pg_search_scope :search_full_text, against: %i[skills city]

    validates :body, presence: true
  end
end
