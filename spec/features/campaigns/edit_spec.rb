require 'rails_helper'

RSpec.describe '/campaigns/:campaign_id/edit', type: :feature do
  before(:each) do
    @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Lucy', first_dm: false, difficult_rating: 4)
  end
  it 'I see a link to update the Campaign on the campaigns index page' do

    visit "/campaigns/#{@dragon_heist.id}"
    click_button("Update Campaign")

    expect(page).to have_current_path("/campaigns/#{@dragon_heist.id}/edit")

    fill_in("DM Name:", with: 'Carl')
    click_button('Update')

    expect(page).to have_current_path("/campaigns/#{@dragon_heist.id}")
    expect(page).to have_content('Carl')
  end
end