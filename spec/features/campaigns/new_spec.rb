require 'rails_helper'

RSpec.describe '/campaigns/new', type: :feature do
  it 'I see a link to create a new Campaign record from campaign index' do

    visit '/campaigns'
    click_link("New Campaign")

    expect(page).to have_current_path('/campaigns/new')

    fill_in 'Campaign Name:', with: 'Tales from the Infinite Staircase'
    fill_in 'DM Name:', with: 'Tony'
    select 'No', from: "First DM:"
    fill_in 'Difficulty Rating:', with: 5
    click_button("Create")

    expect(page).to have_current_path('/campaigns')

    expect(page).to have_content('Tales from the Infinite Staircase')

  end
end