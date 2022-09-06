module Spree
  module Api
    module V2
      module Storefront
        class PriceListsController < ::Spree::Api::V2::ResourceController

					def index
						@price_lists = PriceList.all
						render json: @price_lists
					end

					def show
						@price_lists = PriceList.find(params[:id])
						render json: @price_lists
					end

					def create
						begin
		      				PriceList.transaction do
		        				if @price_lists = PriceList.create!(price_list_params)	
									render json: { message: 'Successfuly Created.'}, status: 201
								end
							end
		    			rescue ActiveRecord::RecordInvalid => exception
		      				@price_lists = {
		       					error: {
		          				status: 400,
		            			message: 'Unable to Create.'
						        }
							}
						end
					end

					def destroy
						@price_lists = PriceList.find(params[:id])
						if @price_lists
							@price_lists.destroy
							render json: { error: 'Successfuly Deleted.'}, status: 204
						else
							render error: { error: 'Unable to Delete.'}, status: 400
						end
					end

					rescue_from ActionController::ParameterMissing do
				  		render :nothing => true, :status => :bad_request
					end

						
					private

					def price_list_params
				  		params.permit(price_lists: ([:brand, :end_date, :start_date])).require(:price_lists)
					end
        end
      end
    end
  end
end
