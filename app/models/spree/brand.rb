class Spree::Brand < Spree::Base
  
  has_many :price_date_lists
  
  self.whitelisted_ransackable_attributes = %w[brand]
end
