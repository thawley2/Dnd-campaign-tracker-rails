require 'rails_helper'

RSpec.describe '/players', type: :feature do
  
  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5)
    @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Lucy', first_dm: false, difficult_rating: 4)

    @angel = @waterdeep.players.create!(player_name: 'Angel', character_name: 'Snow Devil', new_player: true, char_lvl: 2)
    @margaret = @waterdeep.players.create!(player_name: 'Margaret', character_name: 'Marcus Arelious', new_player: false, char_lvl: 5)

    @crow = @dragon_heist.players.create!(player_name: 'Crow', character_name: 'Nocturia', new_player: true, char_lvl: 2)
    @alec = @dragon_heist.players.create!(player_name: 'Alec', character_name: 'Hockly', new_player: true, char_lvl: 2)
    @andrew = @dragon_heist.players.create!(player_name: 'Andrew', character_name: 'Georgio Clunamous', new_player: false, char_lvl: 2)
  end

  describe 'as a visitor, when I visit the players index page' do

    it 'I see only players in the system where new_player = true including the players attributes' do
      visit '/players'

      expect(page).to have_content(@angel.player_name)
      expect(page).to have_content("Character Name: #{@angel.character_name}")
      expect(page).to have_content("New Player: #{@angel.new_player}")
      expect(page).to have_content("Character Level: #{@angel.char_lvl}")

      expect(page).to_not have_content(@margaret.player_name)
      expect(page).to_not have_content("Character Name: #{@margaret.character_name}")
      expect(page).to_not have_content("New Player: #{@margaret.new_player}")
      expect(page).to_not have_content("Character Level: #{@margaret.char_lvl}")

      expect(page).to have_content(@crow.player_name)
      expect(page).to have_content("Character Name: #{@crow.character_name}")
      expect(page).to have_content("New Player: #{@crow.new_player}")
      expect(page).to have_content("Character Level: #{@crow.char_lvl}")

      expect(page).to have_content(@alec.player_name)
      expect(page).to have_content("Character Name: #{@alec.character_name}")
      expect(page).to have_content("New Player: #{@alec.new_player}")
      expect(page).to have_content("Character Level: #{@alec.char_lvl}")
    end

    it 'I see a link at the top of the page that takes me to the Players index' do

      visit "/campaigns/#{@dragon_heist.id}" 
      
      click_link('Players')

      expect(page).to have_current_path('/players')
    end
    
    it 'I see a link at the top of the page that takes me to the Campaigns index' do

      visit '/players' 
      click_link('Campaigns')

      expect(page).to have_current_path('/campaigns')
    end

    it 'I see a button next to every player to edit their information' do
      visit '/players'
      click_button("Update #{@angel.player_name}")

      expect(page).to have_current_path("/players/#{@angel.id}/edit")

      fill_in("Character Name:", with: 'Snow Angel')

      click_button('Update')

      expect(page).to have_current_path("/players/#{@angel.id}")
      expect(page).to have_content('Snow Angel')
      expect(page).to_not have_content('Snow Devil')

    end

    it 'it has a delete button next to each player' do
      visit '/players'
      
      click_button("Delete #{@angel.player_name}")

      expect(current_path).to eq('/players')
      expect(page).to_not have_content(@angel.player_name)
      expect(page).to have_content(@crow.player_name)
    end
  end
end