class CreateTreatmentHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :treatment_histories do |t|
      t.references :user, foreign_key: true
      t.references :appointment, foreign_key: true
      # Добавьте другие поля, если нужно
      t.timestamps
    end
  end
end
