class PricingSerializer < ActiveModel::Serializer
  attributes :description, :beginRange, :endRange, :unit, :pricePerUnit, :effectiveDate

  def description
    object.description
  end

  def beginRange
    object.begin_range
  end

  def endRange
    object.end_range
  end

  def unit
    object.unit
  end

  def pricePerUnit
    object.price_per_unit['USD']
  end

  def effectiveDate
    object.effective_date
  end
end
