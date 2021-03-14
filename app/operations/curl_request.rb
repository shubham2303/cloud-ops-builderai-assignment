require 'net/http'
require 'net/https'

#This class is used to call any third party service with the given uri
class CurlRequest

  # This method is used to initialize the uri which we want to call
  def initialize(uri)
    @uri = URI.parse(uri)
  end

  # This method is used to get the response from third party API
  # Like CurlRequest.new("https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json").call
  #
  def post
    Net::HTTP.get_response(@uri)
  end
end
