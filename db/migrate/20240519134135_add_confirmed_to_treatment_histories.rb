class AddConfirmedToTreatmentHistories < ActiveRecord::Migration[7.1]
  def change
    add_column :treatment_histories, :confirmed, :boolean
  end
end
