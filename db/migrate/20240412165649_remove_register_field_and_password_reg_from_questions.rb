class RemoveRegisterFieldAndPasswordRegFromQuestions < ActiveRecord::Migration[7.1]
  def change
    remove_column :questions, :register_field, :string
    remove_column :questions, :password_reg, :string
  end
end
