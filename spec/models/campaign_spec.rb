require 'rails_helper' 

RSpec.describe Campaign, type: :model do
  before(:each) do
    @waterdeep = Campaign.create!(campaign_name: 'Waterdeep', dm_name: 'Thomas', first_dm: true, difficult_rating: 5)
    @dragon_heist = Campaign.create!(campaign_name: 'Dragon Heist', dm_name: 'Dan', first_dm: false, difficult_rating: 4,)

    @crow = @dragon_heist.players.create!(player_name: 'Crow', character_name: 'Nocturia', new_player: true, char_lvl: 3)
    @alec = @dragon_heist.players.create!(player_name: 'Alec', character_name: 'Hockly', new_player: false, char_lvl: 2)
    @andrew = @dragon_heist.players.create!(player_name: 'Andrew', character_name: 'Georgio Clunamous', new_player: false, char_lvl: 2)
  end

  describe 'relationships' do
    it { should have_many(:players) }
  end

  describe 'instance methods' do
    describe '#order_by_created_at' do
      it 'can order campaigns by their created_at date' do
        
        expect(Campaign.order_by_created_at).to eq([@waterdeep, @dragon_heist])
        
        @dragon_heist.created_at = "2012-02-27 00:00:00"
        @dragon_heist.save
        
        expect(Campaign.order_by_created_at).to eq([@dragon_heist, @waterdeep])
      end
    end
    describe '#num_of_players' do
      it 'can return an integer of the number of players for a campaign' do
        expect(@dragon_heist.num_of_players).to eq(3)
      end
    end
    
    describe '#order_players()' do
      it 'can order players in a campaign by their player_name' do
        expect(@dragon_heist.order_players({order_by: 'player_name'})).to eq([@alec, @andrew, @crow])
      end
    end

    describe '#sort_players_by_lvl' do
      it 'can select players above a certain char_lvl' do
        expect(@dragon_heist.sort_players_by_lvl({level: 2})).to eq([@crow])
      end
    end

    describe '#retrieve_players' do
      it 'can retrieve players by what is set in the params' do

        expect(@dragon_heist.retrieve_players({order_by: nil})).to eq([@crow, @alec, @andrew])
        expect(@dragon_heist.retrieve_players({order_by: 'player_name'})).to eq([@alec, @andrew, @crow])
        expect(@dragon_heist.retrieve_players({level: 2})).to eq([@crow])
      end
    end
  end
end