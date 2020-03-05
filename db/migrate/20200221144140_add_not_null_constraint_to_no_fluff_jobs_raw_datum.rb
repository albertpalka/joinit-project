class AddNotNullConstraintToNoFluffJobsRawDatum < ActiveRecord::Migration[6.0]
  def change
    change_column_null :no_fluff_jobs_raw_data, :body, false
  end
end
