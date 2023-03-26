require 'rails_helper'

RSpec.describe '/campaigns/:id', type: :feature do

  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5)
    @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Lucy', first_dm: false, difficult_rating: 4)

    @crow = @dragon_heist.players.create!(player_name: 'Crow', character_name: 'Nocturia', new_player: true, char_lvl: 2)
    @alec = @dragon_heist.players.create!(player_name: 'Alec', character_name: 'Hockly', new_player: false, char_lvl: 2)
    @andrew = @dragon_heist.players.create!(player_name: 'Andrew', character_name: 'Georgio Clunamous', new_player: false, char_lvl: 2)
  end

  describe 'as a visitor, when I visit the campaign show page' do
    it 'I see the campaign with that id including the campaign attributes' do

      visit "/campaigns/#{@waterdeep.id}"

      expect(page).to have_content(@waterdeep.campaign_name)
      expect(page).to have_content("Name of DM: #{@waterdeep.dm_name}")
      expect(page).to have_content("First DM: #{@waterdeep.first_dm}")
      expect(page).to have_content("Difficult Rating: #{@waterdeep.difficult_rating}")
    end

    it 'shows the number of players that are in the campaign' do
      
      visit "/campaigns/#{@dragon_heist.id}"
      
      expect(page).to have_content("Total Players: #{@dragon_heist.players.size}")
    end

    it 'I see a link at the top of the page that takes me to the Players index' do

      visit "/campaigns/#{@dragon_heist.id}" 
      
      click_link('Players')

      expect(page).to have_current_path('/players')
    end

    it 'I see a link at the top of the page that takes me to the Campaigns index' do

      visit "/campaigns/#{@dragon_heist.id}" 
      click_link('Campaigns')

      expect(page).to have_current_path('/campaigns')
    end

    it 'I see a button to take me to that Campaigns Players page' do
      visit "/campaigns/#{@dragon_heist.id}"
      click_link("#{@dragon_heist.campaign_name} Players")

      expect(page).to have_current_path("/campaigns/#{@dragon_heist.id}/players")
    end
  end
end