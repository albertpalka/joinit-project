class AddNewColumnToNoFluffJobsParsedOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :no_fluff_jobs_parsed_offers, :body, :jsonb
  end
end
