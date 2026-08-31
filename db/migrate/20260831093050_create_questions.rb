class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.text :question
      t.string :answer
      t.references :escape_game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
