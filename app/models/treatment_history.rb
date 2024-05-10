# treatment_history.rb
class TreatmentHistory < ApplicationRecord
  belongs_to :user
  belongs_to :appointment
end
