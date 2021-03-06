Rails.application.routes.draw do

  get   '/start', :to => 'sessions#checklogin', :as => :start

  get '/login',:to => 'sessions#login',:as => :login

  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => 'sessions#failure'
  get 'logout' => 'sessions#destroy'

  root :to => redirect('/start')

  resources :users do
    resources :events
  end

  get 'users/:id/view' => 'users#view',:as=> :showprofile
  get 'users/:id/displayUsers' => 'users#displayUsers',:as=> :displayUsers
  get 'users/:id/:name/addFriend' => 'users#addFriend',:as=> :addFriend
  get 'users/:id/setMeeting/:friend_id' => 'users#setMeeting',:as=> :set_up_a_meeting

  get 'users/:id/showFriend/:friend_id' => 'users#showFriend',:as=> :showFriend



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
