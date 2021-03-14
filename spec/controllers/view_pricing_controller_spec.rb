# frozen_string_literal: true

require 'rails_helper'

describe ViewPricingController, type: :controller do
  let(:valid_params) do
    {
        date: "2020-10-01T00:00:00Z"
    }
  end

  describe 'GET #index with region' do
    before do
      FactoryBot.create(:pricing_list)
      request.headers['Content-Type'] = 'application/json'
      get "/service/AmazonCloudFront/region/us-east-1", format: :json
    end

    it 'returns proper data' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #index with date' do
    before do
      FactoryBot.create(:pricing_list)
      request.headers['Content-Type'] = 'application/json'
      get "/service/AmazonCloudFront/region/us-east-1", format: :json, :params => { :widget => valid_params}
    end

    it 'returns proper data' do
      expect(response).to have_http_status(:success)
    end
  end


end