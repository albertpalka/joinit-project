class RemoveNoFluffJobsRawDatafromNoFluffJobsParsedOffers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :no_fluff_jobs_parsed_offers, :no_fluff_jobs_raw_datum, index: true, foreign_key: true
  end
end
