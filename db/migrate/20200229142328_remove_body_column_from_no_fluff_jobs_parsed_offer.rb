class RemoveBodyColumnFromNoFluffJobsParsedOffer < ActiveRecord::Migration[6.0]
  def change
    remove_column :no_fluff_jobs_parsed_offers, :body
  end
end
