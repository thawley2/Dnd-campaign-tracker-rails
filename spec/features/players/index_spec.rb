require 'rails_helper'

RSpec.describe '/players', type: :feature do
  
  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5)
    @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Lucy', first_dm: false, difficult_rating: 4)

    @angel = @waterdeep.players.create!(player_name: 'Angel', character_name: 'Snow Devil', new_player: false, char_lvl: 2)
    @margaret = @waterdeep.players.create!(player_name: 'Margaret', character_name: 'Marcus Arelious', new_player: false, char_lvl: 2)

    @crow = @dragon_heist.players.create!(player_name: 'Crow', character_name: 'Nocturia', new_player: true, char_lvl: 2)
    @alec = @dragon_heist.players.create!(player_name: 'Alec', character_name: 'Hockly', new_player: false, char_lvl: 2)
    @andrew = @dragon_heist.players.create!(player_name: 'Andrew', character_name: 'Georgio Clunamous', new_player: false, char_lvl: 2)
  end

  describe 'as a visitor, when I visit the players index page' do

    it 'I see each player in the system including the players attributes' do
      visit '/players'

      expect(page).to have_content(@angel.character_name)
      expect(page).to have_content("Player Name: #{@angel.player_name}")
      expect(page).to have_content("New Player: #{@angel.new_player}")
      expect(page).to have_content("Character Level: #{@angel.char_lvl}")

      expect(page).to have_content(@margaret.character_name)
      expect(page).to have_content("Player Name: #{@margaret.player_name}")
      expect(page).to have_content("New Player: #{@margaret.new_player}")
      expect(page).to have_content("Character Level: #{@margaret.char_lvl}")

      expect(page).to have_content(@crow.character_name)
      expect(page).to have_content("Player Name: #{@crow.player_name}")
      expect(page).to have_content("New Player: #{@crow.new_player}")
      expect(page).to have_content("Character Level: #{@crow.char_lvl}")

      expect(page).to have_content(@alec.character_name)
      expect(page).to have_content("Player Name: #{@alec.player_name}")
      expect(page).to have_content("New Player: #{@alec.new_player}")
      expect(page).to have_content("Character Level: #{@alec.char_lvl}")
    end
  end
end