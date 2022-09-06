class AddSpreeBrandsToSpreePriceDateLists < ActiveRecord::Migration[6.1]
  def change
    add_reference :spree_price_date_lists, :spree_brand

  end
end
