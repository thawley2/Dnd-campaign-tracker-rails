require 'rails_helper'

RSpec.describe '/campaigns', type: :feature do
  describe 'as a visitor, when I visit the campaigns index page' do
    before(:each) do
      @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5)
      @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Lucy', first_dm: false, difficult_rating: 4)
    end
    it 'see the name of each campaign record in the system' do

      visit '/campaigns'

      expect(page).to have_content('DnD Campaigns')
      expect(page).to have_content(@waterdeep.campaign_name)
      expect(page).to have_content(@dragon_heist.campaign_name)
    end
  end
end