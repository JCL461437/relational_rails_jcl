RSpec.describe Fighter, type: :model do
  describe 'relationships' do
    it {should belong_to :gym}
  end
end