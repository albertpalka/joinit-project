class AddIndexToNoFluffJobsParsedOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :no_fluff_jobs_parsed_offers, :raw_datum_id, :integer
  end
end
