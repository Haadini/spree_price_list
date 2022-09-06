class CreateSpreePriceDateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_price_date_lists do |t|
      t.date :end_date
      t.date :start_date

      t.timestamps
    end
  end
end