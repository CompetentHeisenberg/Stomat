class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :doctor_id
      t.string :procedure_id
      t.date :date
      t.time :time
      t.timestamps
    end
  end
end
