module Spree
  module Admin
    class BrandsController < ResourceController
      def update_positions
        params[:positions].each do |id, position|
          brand = Spree::Brand.find(id)
          brand.set_list_position(position)
        end

        respond_to do |format|
          format.js { render plain: 'Ok' }
        end
      end

      private

      def find_resource
        Brand.find(params[:id])
      end

      def collection
        params[:q] = {} if params[:q].blank?
        brands = Spree::Brand.all
        @search = brands.ransack(params[:q])

        @collection = @search.result.
            page(params[:page]).
            per(params[:per_page])
      end

      def format_translations
        return if params[:brand][:translations_attributes].blank?
        params[:brand][:translations_attributes].each do |_, data|
          translation = @brand.translations.find_or_create_by(locale: data[:locale])
          translation.brand = data[:brand]
          translation.save!
        end
      end
    end
  end
end