class Question < ApplicationRecord
  belongs_to :escape_game

  validates :question, presence: true, length: { minimum: 10 }
  validates :answer, presence: true
end
