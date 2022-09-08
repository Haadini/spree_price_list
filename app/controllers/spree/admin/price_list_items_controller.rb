module Spree
  module Admin
    class PriceListItemsController < ResourceController
      belongs_to 'spree/price_date_list', find_by: :id

      def update_positions
        params[:positions].each do |id, position|
          price_list_item = Spree::PriceListItem.find(id)
          price_list_item.set_list_position(position)
        end

        respond_to do |format|
          format.js { render plain: 'Ok' }
        end
      end

      private

      def find_resource
          @price_list_item = @object = parent.all_price_list_items.find(params[:id])
      end
      def build_resource
        parent.price_list_items.build(price_date_list: parent)
      end

      def collection
        params[:q] = {} if params[:q].blank?
        price_list_items = Spree::PriceListItem.where(price_date_list_id: params[:price_date_list_id])
        @search = price_list_items.ransack(params[:q])

        @collection = @search.result.
            page(params[:page]).
            per(params[:per_page])
      end

      def format_translations
        return if params[:price_list_item][:translations_attributes].blank?
        params[:price_list_item][:translations_attributes].each do |_, data|
          translation = @price_item.translations.find_or_create_by(locale: data[:locale])
          translation.product = data[:product]
          translation.price = data[:price]
          translation.save!
        end
      end
    end
  end
end
