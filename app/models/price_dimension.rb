#This model is used to capture all the information of price_dimensions like
# :rate_code
# :description
# :begin_range
# :end_range
# :unit
# :region
# :effective_date
# price_per_unit
# :applies_to
# And assocication with term
class PriceDimension < ApplicationRecord

  belongs_to :term
end
