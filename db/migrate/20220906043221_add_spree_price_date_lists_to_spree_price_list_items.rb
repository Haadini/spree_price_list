class AddSpreePriceDateListsToSpreePriceListItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :spree_price_list_items, :spree_price_date_list

  end
end
