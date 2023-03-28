require 'rails_helper'

RSpec.describe '/campaigns/:campaign_id/players/new', type: :feature do
  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5) 
  end

  describe 'When I visit a campaigns players index page I see a link to create a new player' do
    it 'I click on the link to create a new player and fill out new player info' do

      visit "/campaigns/#{@waterdeep.id}/players"
      click_button('Add Player')

      expect(page).to have_current_path("/campaigns/#{@waterdeep.id}/players/new")

      fill_in('Player Name:', with: 'Starsky')
      fill_in('Character Name:', with: 'Doggy Doggerston')
      select 'Yes', :from => "New Player:"
      fill_in('Character Level:', with: 1)

      click_button("Add Player")

      expect(page).to have_current_path("/campaigns/#{@waterdeep.id}/players")
      expect(page).to have_content('Starsky')
      expect(page).to have_content('Doggy Doggerston')
    end
  end
end