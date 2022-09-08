module Spree
  module Admin
    module PriceListItemsHelper
      def find_resource
          @price_date_list = @object = parent.all_price_date_lists.find(params[:id])
      end
      def build_resource
        parent.price_date_lists.build(brand: parent)
      end
    end
  end
end
