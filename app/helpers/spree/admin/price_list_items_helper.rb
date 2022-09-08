module Spree
  module Admin
    module PriceListItemsHelper
      private
      def cc
        price_date_lists = Spree::PriceDateList.where(brand_id: params[:brand_id])
      end
      
      def find_resource
          @price_date_list = @object = parent.all_price_date_lists.find(params[:id])
      end
      def build_resource
        cc
        parent.price_date_lists.build(brand: parent)
      end
    
    end
  end
end
