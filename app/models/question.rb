class Question < ApplicationRecord
  belongs_to :escape_game

  validates :question, presence: true, length: { minimum: 10 }
  validates :answer, presence: true, length: { minimum: 1, allow_blank: true }

  def correct?(given_answer)
    puts "The given_answer is:"
    puts given_answer
    answer.to_s.strip.downcase == given_answer.to_s.strip.downcase
  end
end
