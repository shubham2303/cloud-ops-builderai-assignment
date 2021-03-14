require 'rails_helper'

RSpec.describe PriceDimension, :type => :model do
  context 'associations' do
    it { should belong_to(:term).class_name('Term') }
  end
end
