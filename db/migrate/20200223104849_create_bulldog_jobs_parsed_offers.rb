class CreateBulldogJobsParsedOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :bulldog_jobs_parsed_offers do |t|

      t.timestamps
    end
  end
end
