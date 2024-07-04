RSpec.describe Gym, type: :model do
  describe 'relationships' do
    it {should have_many :fighters}
  end
end