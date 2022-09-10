module Spree
  module Admin
    class PriceDateListsController < ResourceController
      belongs_to 'spree/brand', find_by: :id
      
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
      def location_after_save
        url_for([:edit, :admin, @order, @customer_return])
      end


      def find_resource
          @price_date_list = @object = parent.all_price_date_lists.find(params[:id])
      end
      def build_resource
        parent.price_date_lists.build(brand: parent)
      end

      def collection
        params[:q] = {} if params[:q].blank?
        price_date_lists = Spree::PriceDateList.where(brand_id: params[:brand_id])
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
