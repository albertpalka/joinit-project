class AddNotNullConstraintsToTables < ActiveRecord::Migration[6.0]
  def change
    change_column_null :no_fluff_jobs_parsed_offers, :body, false
  end
end
