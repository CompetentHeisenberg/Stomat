class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
