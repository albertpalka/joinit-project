class AddBodyColumnToBulldogJobsParsedOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :bulldog_jobs_parsed_offers, :body, :string
  end
end
