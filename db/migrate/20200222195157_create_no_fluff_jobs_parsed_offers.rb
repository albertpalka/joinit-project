class CreateNoFluffJobsParsedOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :no_fluff_jobs_parsed_offers do |t|
      t.string :body

      t.timestamps
    end
  end
end
