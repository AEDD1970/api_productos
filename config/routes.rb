Rails.application.routes.draw do
  resources :products, only: [:index, :create, :show, :destroy, :update] do 
    collection do
    get 'show_uniquess/:producname', action: :show_uniquess
    get 'show_typec/:type_product_id', action: :show_typec
    end
  end
  resources :type_product, only: [:index, :create, :show, :destroy, :update] do 
    collection do
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
