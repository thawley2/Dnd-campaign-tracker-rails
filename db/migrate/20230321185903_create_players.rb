class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.references :campaign, foreign_key: true
      t.string :player_name
      t.string :character_name
      t.boolean :new_player
      t.integer :char_lvl

      t.timestamp
    end
  end
end
