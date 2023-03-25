require 'rails_helper' 

RSpec.describe Player, type: :model do
  before(:each) do
    @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Lucy', first_dm: false, difficult_rating: 4)

    @crow = @dragon_heist.players.create!(player_name: 'Crow', character_name: 'Nocturia', new_player: true, char_lvl: 2)
    @angel = @dragon_heist.players.create!(player_name: 'Angel', character_name: 'Snow Devil', new_player: true, char_lvl: 2)
    @margaret = @dragon_heist.players.create!(player_name: 'Margaret', character_name: 'Marcus Arelious', new_player: false, char_lvl: 2)
  end

   describe 'relationships' do
    it { should belong_to(:campaign) }
  end

  describe 'instance methods' do
    it '#player_campaign' do
      expect(@crow.player_campaign).to eq('Dragon Heist')
    end
  end

  describe 'class methods' do
    it '::new_player_true' do
      expect(Player.new_player_true).to eq([@crow, @angel])
    end
  end
end