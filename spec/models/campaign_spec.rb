require 'rails_helper' 

RSpec.describe Campaign, type: :model do
  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5)
    @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Dan', first_dm: false, difficult_rating: 4)

    @crow = @dragon_heist.players.create!(player_name: 'Crow', character_name: 'Nocturia', new_player: true, char_lvl: 2)
    @alec = @dragon_heist.players.create!(player_name: 'Alec', character_name: 'Hockly', new_player: false, char_lvl: 2)
    @andrew = @dragon_heist.players.create!(player_name: 'Andrew', character_name: 'Georgio Clunamous', new_player: false, char_lvl: 2)
  end

  describe 'relationships' do
    it { should have_many(:players) }
  end

  describe 'instance methods' do
    it '::order_by_created_at' do
      
      expect(Campaign.order_by_created_at).to eq([@waterdeep, @dragon_heist])
      
      @dragon_heist.created_at = "2012-02-27 00:00:00"
      @dragon_heist.save

      expect(Campaign.order_by_created_at).to eq([@dragon_heist, @waterdeep])
    end

    it '#num_of_players' do
      
      expect(@dragon_heist.num_of_players).to eq(3)
    end
  end
end