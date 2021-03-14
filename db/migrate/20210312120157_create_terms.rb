class CreateTerms < ActiveRecord::Migration[6.1]
  def change
    create_table :terms do |t|
      t.string :term_type
      t.string :term_uid
      t.string :offer_term_code
      t.string :sku
      t.datetime :effective_date
      t.jsonb :term_attributes,  default: '{}'
      t.references :pricing_list, index: true, foreign_key: true
      t.timestamps
    end
  end
end
