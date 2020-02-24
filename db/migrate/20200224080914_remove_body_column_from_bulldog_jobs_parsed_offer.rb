class RemoveBodyColumnFromBulldogJobsParsedOffer < ActiveRecord::Migration[6.0]
  def change
    remove_column :bulldog_jobs_parsed_offers, :body
  end
end
