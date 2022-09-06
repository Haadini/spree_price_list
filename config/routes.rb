Spree::Core::Engine.add_routes do

  namespace :admin do
    resources :brands do
      resources :price_date_lists do
        resources :price_list_items do
          collection do
            post :update_positions
          end
        end
        patch 'price_list_item_settings' => 'price_list_item_settings#update'
        get 'price_list_item_settings' => 'price_list_item_settings#edit'
        
        collection do
          post :update_positions
        end
      end
      get 'price_date_list_settings' => 'price_date_list_settings#edit'
      patch 'price_date_list_settings' => 'price_date_list_settings#update'

      collection do
        post :update_positions
      end
    end
  end
  
  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
      namespace :storefront do
        resources :price_list_items
      end
    end
  end
  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
      namespace :storefront do
        resources :price_date_lists
      end
    end
  end
end
