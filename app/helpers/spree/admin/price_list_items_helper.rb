module Spree
  module Admin
    module PriceListItemsHelper
      
      private
      

      def build_resource
        parent_price_date_list = Spree::SpreePriceDateList.brand_id

        parent.price_date_lists.build(brand: parent_price_date_list)
      end
      def find_resource
          @price_date_list = @object = parent.all_price_date_lists.find(params[:id])
      end
    
    end
  end
end
