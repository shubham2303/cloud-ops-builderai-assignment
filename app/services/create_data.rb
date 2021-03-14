#This class is called from the sidekiq worker to create data in the database
class CreateData
  include ProductCreation
  include TermCreation

  attr_accessor :response, :pricing_list

  # This method is used to initialize the response from AWS service and to create pricing list for the top level
  def initialize(response)
    @response = response
    @pricing_list = create_pricing_list
  end

  #This method is used to create products and terms from the reponse made through AWS API in the database
  # It can be called like CreateData.new(response).execute
  def execute
    # to create products in the database
    create_products
    # to create terms with price dimension in the database
    create_terms
  end

  private

  # This method is used to create top level data from AWS response
  def create_pricing_list
    hsh = { format_version: response['formatVersion'],
            disclaimer: response['disclaimer'],
            offer_code: response['offerCode'],
            publication_date: response['publicationDate'],
            version: response['version'],
            region: "us-east-1"}


    PricingList.create(hsh)
  end


end
