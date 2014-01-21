LoveMaybe::Application.routes.draw do
  resources :yes_sayings

  resources :date_responses

  resources :date_requests, only: [:create, :destroy, :edit, :update, :new]

  resources :user_dating_usernames

   get '/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'

  get '/responses', to: 'welcome#response_tab'

  resources :users, except: [:show, :edit]

  resources :users, path: "", only: [:show, :edit]

  resources :sessions, only: [:new, :create, :destroy]	

 # get 'signout', to: 'sessions#destroy', as: 'signout' 

 # post 'signout', to: 'sessions#destroy', as: 'signout' 

 # delete 'signout', to: 'sessions#destroy', as: 'signout' 

 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
