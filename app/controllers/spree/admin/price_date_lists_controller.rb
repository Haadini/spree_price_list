module Spree
  module Admin
    class PriceDateListsController < ResourceController
      def update_positions
        params[:positions].each do |id, position|
          price_date_list = Spree::PriceDateList.find(id)
          price_date_list.set_list_position(position)
        end

        respond_to do |format|
          format.js { render plain: 'Ok' }
        end
      end

      private

      def find_resource
        PriceDateList.find(params[:id])
      end
      def build_resource
        parent.price_date_list.build(brand: parent)
      end

      def collection
        params[:q] = {} if params[:q].blank?
        price_date_lists = Spree::PriceDateList.where(spree_brand_id: params[:brand_id])
        @search = price_date_lists.ransack(params[:q])

        @collection = @search.result.
            page(params[:page]).
            per(params[:per_page])
      end

      def format_translations
        return if params[:price_date_list][:translations_attributes].blank?
        params[:price_date_list][:translations_attributes].each do |_, data|
          translation = @price_list.translations.find_or_create_by(locale: data[:locale])
          translation.end_date = data[:end_date]
          translation.start_date = data[:start_date]
          translation.save!
        end
      end
    end
  end
end
