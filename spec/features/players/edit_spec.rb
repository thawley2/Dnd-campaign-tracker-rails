require 'rails_helper'

RSpec.describe '/players/:id/edit', type: :feature do
  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5) 
    @angel = @waterdeep.players.create!(player_name: 'Angel', character_name: 'Snow Devil', new_player: false, char_lvl: 2)
  end

  describe 'I see a link at the bottom of the show page to update the players information' do
    it 'I can click the button and edit the players information' do
      
      visit "players/#{@angel.id}"
      click_button("Update #{@angel.player_name}")
      
      expect(page).to have_current_path("/players/#{@angel.id}/edit")
      
      fill_in("Character Name:", with: 'Snow Angel')
      
      click_button('Update')
      
      expect(page).to have_current_path("/players/#{@angel.id}")
      expect(page).to have_content('Snow Angel')
      expect(page).to_not have_content('Snow Devil')
    end
  end
end