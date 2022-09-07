module Spree
  module Admin
    module PriceDateListsHelper
      def display_price_date_listable(price_date_listable)
        case price_date_listable
        when Spree::Brand
          display_brand(price_date_listable)
        end
      end
    end
  end
end
