require 'rails_helper'

RSpec.describe '/campaigns/:campaign_id/players', type: :feature do
  describe 'when I visit /campaigns/:campaign_id/players' do
    before(:each) do
      @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5) 

      @angel = @waterdeep.players.create!(player_name: 'Angel', character_name: 'Snow Devil', new_player: false, char_lvl: 2)
      @crow = @waterdeep.players.create!(player_name: 'Crow', character_name: 'Nocturia', new_player: true, char_lvl: 2)
    end

    it 'I see each player that is associated with that campaign with each players attributes' do
      visit "/campaigns/#{@waterdeep.id}/players"
# save_and_open_page
      expect(page).to have_content("#{@waterdeep.campaign_name} Players")
      expect(page).to have_content("Name: #{@angel.player_name}")
      expect(page).to have_content("Character: #{@angel.character_name}")
      expect(page).to have_content("New: #{@angel.new_player}")
      expect(page).to have_content("Character Level: #{@angel.char_lvl}")

      expect(page).to have_content("Name: #{@crow.player_name}")
      expect(page).to have_content("Character: #{@crow.character_name}")
      expect(page).to have_content("New: #{@crow.new_player}")
      expect(page).to have_content("Character Level: #{@crow.char_lvl}")

    end

    it 'I see a link at the top of the page that takes me to the Players index' do

      visit "/campaigns/#{@waterdeep.id}/players" 
      
      click_link('Players')

      expect(page).to have_current_path('/players')
    end

    it 'I see a link at the top of the page that takes me to the Campaigns index' do

      visit "/campaigns/#{@waterdeep.id}/players" 
      # save_and_open_page
      click_link('Campaigns')

      expect(page).to have_current_path('/campaigns')
    end

    it 'I see a link at the bottom of the page to add a new player to the campaign, "Add Player"' do
      visit "/campaigns/#{@waterdeep.id}/players"
      click_button('Add Player')

      expect(page).to have_current_path("/campaigns/#{@waterdeep.id}/players/new")

      fill_in('Player Name:', with: 'Starsky')
      fill_in('Character Name:', with: 'Doggy Doggerston')
      fill_in('New Player:', with: true)
      fill_in('Character Level:', with: 1)

      click_button("Add Player")

      expect(page).to have_current_path("/campaigns/#{@waterdeep.id}/players")
      expect(page).to have_content('Starsky')
      expect(page).to have_content('Doggy Doggerston')
    end
  end
end