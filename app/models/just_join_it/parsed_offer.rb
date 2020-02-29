# frozen_string_literal: true

module JustJoinIt
  class ParsedOffer < ApplicationRecord
    belongs_to :raw_datum

    include PgSearch::Model
    pg_search_scope :search_full_text, against: %i[skills city]
  end
end
