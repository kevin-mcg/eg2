class CreateEscapeGames < ActiveRecord::Migration[7.2]
  def change
    create_table :escape_games do |t|
      t.string :title
      t.text :description
      t.integer :difficulty

      t.timestamps
    end
  end
end
