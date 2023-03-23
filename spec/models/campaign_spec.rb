require 'rails_helper' 

RSpec.describe Campaign, type: :model do
  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5)
    sleep(1)
    @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Dan', first_dm: false, difficult_rating: 4)
  end

  describe 'relationships' do
    it { should have_many(:players) }
  end

  describe 'instance methods' do
    it '#order_created_at' do
      
      expect(Campaign.order_by_created_at).to eq([@waterdeep, @dragon_heist])
    end
  end
end