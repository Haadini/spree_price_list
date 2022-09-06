class CreateSpreeBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_brands do |t|
      t.string :brand
      t.timestamps
    end
  end
end
