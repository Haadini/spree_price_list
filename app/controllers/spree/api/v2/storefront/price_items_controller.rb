module Spree
  module Api
    module V2
      module Storefront
        class PriceItemsController < ::Spree::Api::V2::ResourceController

					def index
						@price_items = PriceItem.all
						render json: @price_items
					end

					def show
						@price_items = PriceItem.find(params[:id])
						render json: @price_items
					end

					def create
						begin
		      				PriceItem.transaction do
		        				if @price_items = PriceItem.create!(price_item_params)	
									render json: { message: 'Successfuly Created.'}, status: 201
								end
							end
		    			rescue ActiveRecord::RecordInvalid => exception
		      				@price_items = {
		       					error: {
		          				status: 400,
		            			message: 'Unable to Create.'
						        }
							}
						end
					end

					def destroy
						@price_items = PriceItem.find(params[:id])
						if @price_items
							@price_items.destroy
							render json: { error: 'Successfuly Deleted.'}, status: 204
						else
							render error: { error: 'Unable to Delete.'}, status: 400
						end
					end

					rescue_from ActionController::ParameterMissing do
				  		render :nothing => true, :status => :bad_request
					end

						
					private

					def price_item_params
				  		params.permit(price_items: ([:product, :price, :spree_price_list_id])).require(:price_items)
					end
        end
      end
    end
  end
end
