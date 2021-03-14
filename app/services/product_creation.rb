# This module is included in the CreatData class for the product creation
module ProductCreation

  # By using this method products can be inserted in the database through bulk mode
  def create_products
    Product.insert_all(get_products)
  end

  # This method is used to get the product list in array from the AWS response
  def get_products
    products = response['products']
    products_ops = []
    products.each_value do |value|
      product = {}
      product[:sku] = value['sku']
      product[:product_family] = value['productFamily']
      product[:pricing_list_id] = pricing_list.id
      attributes = value['attributes']
      product[:service_code] = attributes['servicecode']
      product[:location] = attributes['location']
      product[:location_type] = attributes['locationType']
      product[:usage_type] = attributes['usagetype']
      product[:operation] = attributes['operation']
      product[:request_description] = attributes['requestDescription']
      product[:request_type] = attributes['requestType']
      product[:service_name] = attributes['servicename']
      product[:pricing_list_id] = pricing_list.id
      product[:created_at] = Time.zone.now.utc
      product[:updated_at] = Time.zone.now.utc
      products_ops << product
    end
    products_ops
  end
end