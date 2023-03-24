require 'rails_helper' 

RSpec.describe Player, type: :model do
   describe 'relationships' do
    it { should belong_to(:campaign) }
  end

  describe 'instance methods' do
    before(:each) do
      @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Lucy', first_dm: false, difficult_rating: 4)
      @crow = @dragon_heist.players.create!(player_name: 'Crow', character_name: 'Nocturia', new_player: true, char_lvl: 2)
    end
    it '#player_campaign' do
      expect(@crow.player_campaign).to eq('Dragon Heist')
    end
  end
end