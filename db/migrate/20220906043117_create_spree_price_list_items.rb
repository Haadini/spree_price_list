class CreateSpreePriceListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_price_list_items do |t|
      t.string :product
      t.bigint :price

      t.timestamps
    end
  end
end
