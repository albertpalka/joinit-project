class Offer < ApplicationRecord
  scope :with_salary, -> { where.not(salary: '') }
  scope :current_offers, -> { where.not(stale: true) }

  include PgSearch::Model
  pg_search_scope :search_full_text, against: %i[title city]
end
