#This service provides methods that allow you to fetch information from
# view_pricing index API and applies filters also like region and date

class GetPricing

  attr_accessor :effective_date, :match

  #This method is to take params(date and region) and initialize date and matching filters region
  def initialize(params)
    @params = params
    @effective_date = params[:date].to_s || params[:effectiveDate].to_s
    @match = {region: params[:region]}
  end

  # This method is used to execute service with database query
  # like GetPricing.new(params).call
  def call
    date_filter
    #Calling database query with filters to fetch the data
    PriceDimension.where(match)
  end

  private
  # This method is used to filter the data with the effective date
  def date_filter
    match.merge!(effective_date: effective_date) unless effective_date.empty?
  end
end
