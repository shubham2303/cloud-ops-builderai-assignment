require 'rails_helper'

RSpec.describe PricingList, :type => :model do
  context 'associations' do
    it { should have_many(:terms) }
    it { should have_many(:products) }
  end
end
