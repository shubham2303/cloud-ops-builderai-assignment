class CreatePricingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :pricing_lists do |t|
      t.string :format_version
      t.text :disclaimer
      t.string :offer_code
      t.string :version
      t.datetime :publication_date
      t.string :region
      t.timestamps
    end
  end
end
