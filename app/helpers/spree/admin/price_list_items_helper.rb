module Spree
  module Admin
    module PriceListItemsHelper
      private
      def collection
        params[:q] = {} if params[:q].blank?
        price_date_lists = Spree::PriceDateList.where(brand_id: params[:brand_id])
        @search = price_date_lists.ransack(params[:q])

        @collection = @search.result.
            page(params[:page]).
            per(params[:per_page])
      end
      
      def find_resource
          @price_date_list = @object = parent.all_price_date_lists.find(params[:id])
      end
      def build_resource
        parent.price_date_lists.build(brand: parent)
      end
    
    end
  end
end
