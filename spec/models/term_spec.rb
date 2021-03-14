require 'rails_helper'

RSpec.describe Term, :type => :model do
  context 'associations' do
    it { should belong_to(:pricing_list) }
    it { should have_many(:price_dimensions) }
  end
end
