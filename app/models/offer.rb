class Offer < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_full_text, against: %i[title]

end
