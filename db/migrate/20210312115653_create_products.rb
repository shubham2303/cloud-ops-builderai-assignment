class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :product_family
      t.string :service_code
      t.string :location
      t.string :location_type
      t.string :usage_type
      t.string :operation
      t.string :request_description
      t.string :request_type
      t.string :service_name
      t.references :pricing_list, index: true, foreign_key: true
      t.timestamps
    end
  end
end
