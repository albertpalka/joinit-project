class AddRawDatumIdToBulldogJobsParsedOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :bulldog_jobs_parsed_offers, :raw_datum_id, :integer
  end
end
