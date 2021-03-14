#This model is used to capture all the information of terms like
# :term_type
# :term_uid
# :offer_term_code
# :sku
# :effective_date
# :term_attributes
# And also have association with pricinglist and price_dimensions
class Term < ApplicationRecord

  belongs_to :pricing_list
  has_many :price_dimensions
end
