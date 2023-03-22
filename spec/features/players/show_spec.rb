require 'rails_helper'

RSpec.describe '/players/:id', type: :feature do

  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5) 
    @angel = @waterdeep.players.create!(player_name: 'Angel', character_name: 'Snow Devil', new_player: false, char_lvl: 2)
  end

  describe 'As a visitor, when I visit the players show page' do
    it 'I see the player with that id including the players attributes' do

      visit "/players/#{@angel.id}"

      expect(page).to have_content(@angel.player_name)
      expect(page).to have_content(@angel.character_name)
      expect(page).to have_content(@angel.new_player)
      expect(page).to have_content(@angel.char_lvl)
    end
  end
end