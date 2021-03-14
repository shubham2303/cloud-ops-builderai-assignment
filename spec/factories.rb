FactoryBot.define do
  #This is the factory to create price dimension data
  factory :price_dimension do
    rate_code {'F24VFUTRVY389U5R.JRTCKXETXF.6YS6EN2CT7"'}
    description {"$0.009 per 10,000 Origin Shield Requests"}
    begin_range {"0"}
    end_range {'Inf'}
    unit {"Requests"}
    region {"us-east-1"}
    effective_date {''}
    price_per_unit {{
      "USD": "0.0000012000"
    }}
    applies_to {[]}
    association :term
  end


end
#
FactoryBot.define do
  #This is the factory to create term data
  factory :term do
    term_type {'OnDemand'}
    term_uid {''}
    offer_term_code {'JRTCKXETXF'}
    sku {'F24VFUTRVY389U5R'}
    association :pricing_list
  end
end

FactoryBot.define do
  #This is the factory to create pricing_list data
  factory :pricing_list do
    format_version {'v1.0'}
    disclaimer {'This pricing list is for informational purposes only. All prices are subject to the additional terms included in the pricing pages on http://aws.amazon.com. All Free Tier prices are also subject to the terms included at https://aws.amazon.com/free/'}
    offer_code {'AmazonCloudFront'}
    version {'20210310232145'}
    publication_date {'2021-03-10T23:21:45Z'}
    region {'us-east-1'}
  end
end