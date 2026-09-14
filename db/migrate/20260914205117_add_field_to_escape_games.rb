class AddFieldToEscapeGames < ActiveRecord::Migration[7.2]
  def change
    add_column :escape_games, :image_file_name, :string, default: "placeholder.png"
  end
end
