# This module is included in the CreatData class for the term creation with the price dimension
module TermCreation

  # By using this method terms can be inserted with the price dimension in the database
  def create_terms
    term_ops = []
    terms = response['terms']
    typ = terms.keys
    term_data = terms.values[0]
    terms_hsh = {}
    term_data.map do |_key, data|
      data = data.values[0]
      terms_hsh[:term_type] = typ
      terms_hsh[:offer_term_code] = data['offerTermCode']
      terms_hsh[:sku] = data['sku']
      terms_hsh[:term_attributes] = data['termAttributes']
      terms_hsh[:pricing_list_id] = @pricing_list.id
      term = Term.create!(terms_hsh)

      price_dimensions = {}
      data['priceDimensions'].values.each do |p_d|
        terms_hsh[:pricing_list_id] = pricing_list.id
        price_dimensions[:rate_code] = p_d['rateCode']
        price_dimensions[:effective_date] = data['effectiveDate']
        price_dimensions[:description] = p_d['description']
        price_dimensions[:begin_range] = p_d['beginRange']
        price_dimensions[:end_range] = p_d['endRange']
        price_dimensions[:unit] = p_d['unit']
        price_dimensions[:price_per_unit] = p_d['pricePerUnit']
        price_dimensions[:applies_to] = p_d['appliesTo']
        PriceDimension.create!(price_dimensions.merge!(term_id: term.id, region: "us-east-1"))
      end
    end
    term_ops
  end

end