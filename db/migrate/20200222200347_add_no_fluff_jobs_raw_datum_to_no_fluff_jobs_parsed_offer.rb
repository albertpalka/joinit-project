class AddNoFluffJobsRawDatumToNoFluffJobsParsedOffer < ActiveRecord::Migration[6.0]
  def change
    add_reference :no_fluff_jobs_parsed_offers, :no_fluff_jobs_raw_datum, null: false, foreign_key: true
  end
end
