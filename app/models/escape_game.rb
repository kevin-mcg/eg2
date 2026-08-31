class EscapeGame < ApplicationRecord
  has_many :questions, dependent: :destroy
end
