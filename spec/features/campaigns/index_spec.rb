require 'rails_helper'

RSpec.describe '/campaigns', type: :feature do
  
  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5)
    @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Lucy', first_dm: false, difficult_rating: 4)
  end

  describe 'as a visitor, when I visit the campaigns index page' do
    it 'see the name of each campaign record in the system' do

      visit '/campaigns'

      expect(page).to have_content('DnD Campaigns')
      expect(page).to have_content(@waterdeep.campaign_name)
      expect(page).to have_content(@dragon_heist.campaign_name)
    end

    it 'I see that campaigns are ordered by most recently created first along with when it was created' do

      visit '/campaigns' 
      
      expect(page).to have_content("Created: #{@waterdeep.created_at}")
      expect(page).to have_content("Created: #{@dragon_heist.created_at}")
      expect(@waterdeep.campaign_name).to appear_before(@dragon_heist.campaign_name)
    end

    it 'I see a link at the top of the page that takes me to the Players index' do

      visit '/campaigns' 
      click_link('Players')

      expect(page).to have_current_path('/players')
    end

    it 'I see a link at the top of the page that takes me to the Campaigns index' do

      visit '/campaigns' 
      click_link('Campaigns')

      expect(page).to have_current_path('/campaigns')
    end
  end
end