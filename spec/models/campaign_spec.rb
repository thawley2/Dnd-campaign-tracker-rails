require 'rails_helper' 

RSpec.describe Campaign, type: :model do
   describe 'relationships' do
    it { should have_many(:players) }
  end
end