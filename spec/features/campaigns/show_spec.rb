require 'rails_helper'

RSpec.describe '/campaigns/:id', type: :feature do
  
  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5)
    @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Lucy', first_dm: false, difficult_rating: 4)
  end

  describe 'as a visitor, when I visit the campaign show page' do
    it 'I see the campaign with that id including the campaign attributes' do

      visit "/campaigns/#{@waterdeep.id}"
save_and_open_page
      expect(page).to have_content(@waterdeep.campaign_name)
      expect(page).to have_content("Name of DM: #{@waterdeep.dm_name}")
      expect(page).to have_content("First DM: #{@waterdeep.first_dm}")
      expect(page).to have_content("Difficult Rating: #{@waterdeep.difficult_rating}")
    end
  end
end