Rails.application.routes.draw do
  resources :posts
  resources :comments
   resources :categories
  resources :users do 
    member do
     get 'timeline'
     get 'show_followers'
     get 'show_followees'
     post   'follow'
   end 
  end 
  #do
   # member do 
   #   get 'timeline'
   # end
  #end

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/delete'

  get 'comments/index'

  get 'comments/show'

  get 'posts/new'

  get 'posts/create'

  get 'posts/index'

  get 'posts/show'

  get 'posts/edit'

  get 'posts/delete'
  #facebook login routes
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"
  #facebook end



  get 'users/edit' => 'users#edit'
  post 'users/edit' => 'users#update'
  get 'users/:id' => 'users#show'
  namespace :api, defaults: { format: :json } do
   #post '/posts/create' => 'posts#create'
    resources :posts 
   # get '/posts' => 'posts#index'
   # get '/posts/:id' => 'posts#show'
    
   resources :comments
   post 'follows/exists' => 'follows#exists'
   post 'follows/unfollow' => 'follows#unfollow'
   resources :follows
   get '/users/followers/:id' => 'users#followers'
   get '/users/followees/:id' => 'users#followees'
   get '/users/timeline/:id' => 'users#timeline'
   resources :users
   
   # do 
   #  member do
   #   get 'timeline'
   # end 
  # end 
  
   post 'users/exists' => 'users#exists'
   get '/categories/posts/:id' => 'categories#posts'
   resources :categories
  
  end
  #get 'posts/:user_id' => 'posts#index'

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
