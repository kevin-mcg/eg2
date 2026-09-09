class EscapeGame < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :difficulty, presence: true
end
