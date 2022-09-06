class Spree::PriceListItem < Spree::Base
  belongs_to :price_date_list

  self.whitelisted_ransackable_attributes = %w[ptoduct price]
end
