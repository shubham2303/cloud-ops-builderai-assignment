#This model is used to capture all the information of products like
# :sku
# :product_family
# :service_code
# :location
# :location_type
# :usage_type
# :operation
# :request_description
# :request_type
# :service_name
# And also have association with pricinglist
class Product < ApplicationRecord

  belongs_to :pricing_list
end
