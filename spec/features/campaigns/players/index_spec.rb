require 'rails_helper'

RSpec.describe '/campaigns/:campaign_id/players', type: :feature do
  describe 'when I visit /campaigns/:campaign_id/players' do
    before(:each) do
      @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5) 

      @margaret = @waterdeep.players.create!(player_name: 'Margaret', character_name: 'Marcus Arelious', new_player: false, char_lvl: 5)
      @crow = @waterdeep.players.create!(player_name: 'Crow', character_name: 'Nocturia', new_player: true, char_lvl: 2)
      @angel = @waterdeep.players.create!(player_name: 'Angel', character_name: 'Snow Devil', new_player: false, char_lvl: 2)
    end

    it 'I see each player that is associated with that campaign with each players attributes' do
      visit "/campaigns/#{@waterdeep.id}/players"

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

    it 'I see a link to sort children in alphabetical order' do
      visit "/campaigns/#{@waterdeep.id}/players"

      expect(@margaret.player_name).to appear_before(@crow.player_name)
      expect(@crow.player_name).to appear_before(@angel.player_name)

      click_link("Sort Names")

      expect(page).to have_current_path("/campaigns/#{@waterdeep.id}/players?order_by=player_name")
      expect(@angel.player_name).to appear_before(@crow.player_name)
      expect(@crow.player_name).to appear_before(@margaret.player_name)
    end

    it 'I see a button next to every player to edit their information' do
      visit "/campaigns/#{@waterdeep.id}/players"
      click_button("Update #{@angel.player_name}")

      expect(page).to have_current_path("/players/#{@angel.id}/edit")

      fill_in("Character Name:", with: 'Snow Angel')

      click_button('Update')

      expect(page).to have_current_path("/players/#{@angel.id}")
      expect(page).to have_content('Snow Angel')
      expect(page).to_not have_content('Snow Devil')
    end

    it 'I see a button next to every player to edit their information' do
      visit "/campaigns/#{@waterdeep.id}/players"
      click_button("Update #{@crow.player_name}")

      expect(page).to have_current_path("/players/#{@crow.id}/edit")
    end

    it 'has a form to show players above char_lvl' do
      visit "/campaigns/#{@waterdeep.id}/players"

      fill_in "Character lvl:", with: 4

      click_button('Only show players above selected lvl')

      expect(current_path).to eq("/campaigns/#{@waterdeep.id}/players")
      expect(page).to have_content(@margaret.player_name)
      expect(page).to_not have_content(@crow.player_name)
      expect(page).to_not have_content(@angel.player_name)
    end
  end
end