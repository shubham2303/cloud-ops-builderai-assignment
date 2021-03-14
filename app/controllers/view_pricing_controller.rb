#ViewPricingController provides api to fetch pricing of products
class ViewPricingController < ApplicationController

  #This is the index method fetch all prices of all the products
  # This can be called using an API like
  #
  # #@example1  /service/AmazonCloudFront/region/us-east-1
  # #@example2  /service/AmazonCloudFront/region/us-east-1?date=2021-03-01
  #
  # @response would be like {
  #     "data": [
  #         {
  #             "description": "$0.009 per 10,000 Origin Shield Requests",
  #             "beginRange": "0",
  #             "endRange": "Inf",
  #             "unit": "Requests",
  #             "pricePerUnit": "0.0000009000",
  #             "effectiveDate": "2021-03-01"
  #         },
  #         .
  #         .
  #         ]
  def index
    #Calling GetPricing service to fetch price of all the products from database with the params like region and date or effective_date
    response = GetPricing.new(params).call
    Rails.logger.info "==============#{response}============"

    #Calling PricingSerializer to send response in serialize and required format
    data = response.map { |req| PricingSerializer.new(req) }

    #This is to rendering the data to the Client side
    render json: { data: data }
  end
end
