class CreatePriceDimensions < ActiveRecord::Migration[6.1]
  def change
    create_table :price_dimensions do |t|
      t.string :rate_code
      t.string :description
      t.string :begin_range
      t.string :end_range
      t.string :unit
      t.string :region
      t.date :effective_date
      t.jsonb :price_per_unit
      t.jsonb :applies_to, default: []

      t.references :term, index: true, foreign_key: true

      t.timestamps
    end
  end
end
