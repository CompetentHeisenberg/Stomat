class AddDoctorToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :doctor, :string
  end
end
