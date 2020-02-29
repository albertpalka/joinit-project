class Offer < ApplicationRecord
  scope :with_salary, -> { where.not(salary: '') }

  include PgSearch::Model
  pg_search_scope :search_full_text, against: %i[title city]
end
