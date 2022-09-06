class Spree::PriceDateList < Spree::Base
  
  belongs_to :brand
  has_many :price_list_items

  self.whitelisted_ransackable_attributes = %w[end_date start_date]
end
