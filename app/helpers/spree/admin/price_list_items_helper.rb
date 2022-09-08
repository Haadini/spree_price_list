module Spree
  module Admin
    module PriceListItemsHelper
      belongs_to 'spree/brand', find_by: :id

      def find_resource
          @price_date_list = @object = parent.all_price_date_lists.find(params[:id])
      end
      def build_resource
        parent.price_date_lists.build(brand: parent)
      end
    end
  end
end
