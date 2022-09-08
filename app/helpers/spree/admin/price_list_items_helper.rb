module Spree
  module Admin
    module PriceListItemsHelper
      
      private
      
      def find_resource_price_date_list
          @price_date_list = @object = parent.all_price_date_lists.find(params[:id])
      end
      def build_resource_price_date_list
        parent_price_date_list = Spree::SpreePriceDateList.brand_id

        parent.price_date_lists.build(brand: parent_price_date_list)
      end
    
    end
  end
end
