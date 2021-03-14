#This model is used to capture top level data like
# :format_version
# :disclaimer
# :offer_code
# :version
# :publication_date
# :region
# And also have associations with products and terms
class PricingList < ApplicationRecord

  has_many :products
  has_many :terms

end
