# This worker is used fetch the data from the AWS API on daily basis in the background
# We can run this worker manually like AwsDataFetchWorker.perform_async
class AwsDataFetchWorker
  include Sidekiq::Worker
  sidekiq_options backtrace: true

  # AWS API URL
  URL = ENV['AMAZON_API']

  # This method is requesting data from third party API and
  # calling CreateData service for data inserting in the database
  def perform
    # used to make request to get data from AWS API
    response = CurlRequest.new(URL).post
    Rails.logger.info "==============#{response}============"
    body = JSON.parse(response.body)

    # Calling Service to create data in the database from AWS response
    data = CreateData.new(body)
    data.execute
  end
end
