require 'rails_helper'

RSpec.describe '/players/:id', type: :feature do

  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5) 
    @angel = @waterdeep.players.create!(player_name: 'Angel', character_name: 'Snow Devil', new_player: true, char_lvl: 2)
  end

  describe 'As a visitor, when I visit the players show page' do
    it 'I see the player with that id including the players attributes' do

      visit "/players/#{@angel.id}"

      expect(page).to have_content("Member of: #{@waterdeep.campaign_name}")
      expect(page).to have_content(@angel.player_name)
      expect(page).to have_content("Character Name: #{@angel.character_name}")
      expect(page).to have_content("New Player: #{@angel.new_player}")
      expect(page).to have_content("Character Level: #{@angel.char_lvl}")
    end

    it 'I see a link at the top of the page that takes me to the Players index' do

      visit "/players/#{@angel.id}" 
      
      click_link('Players')

      expect(page).to have_current_path('/players')
    end

    it 'I see a link at the top of the page that takes me to the Campaigns index' do
      visit '/players'

      expect(page).to have_content(@angel.player_name)
      
      visit "/players/#{@angel.id}" 
      click_link('Campaigns')

      expect(page).to have_current_path('/campaigns')
    end

    it 'I see a link to delete the player, on click player is deleted and redirect to player index page' do
      visit "/players/#{@angel.id}"
      click_button('Delete')

      expect(current_path).to eq('/players')
      expect(page).to_not have_content(@angel.player_name)
    end
  end
end