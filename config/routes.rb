Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,:controllers => { registrations: 'users/registrations',sessions: 'users/sessions' }


  resources :user_steps
  resources :users, only: [:new, :create]
  resources :pages
  resources :subscriptions do
    get 'cancel'
  end
  #root 'pages#index'
  root 'new_layout#index'
  resources :profiles, only: [:index]
  resources :school_closing_steps
  resources :football_steps
  resources :tap_programs

  get "qc_before_after_school" => "pages#qc_before_after_school"
  get "qc_after_school" => "pages#qc_after_school"
  get "qc_befor_school" => "pages#qc_befor_school"
  get "taps_after_school" => "pages#taps_after_school"
  get "taps_gallery" => "pages#taps_gallery"
  get '/st_payment' => 'pages#st_payment'
  get 'payment' => 'school_closing_steps#payment'
  get 'football_payment' => 'football_steps#football_payment'
  get 'download_pdf' => 'profiles#download_pdf'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'program' => 'pages#program'
  get 'gallery' => 'pages#gallery'
  get 'football_camp' => 'tap_programs#football_camp'
  post 'register_football' => 'tap_programs#register_football'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  post 'school_registration/:id' => 'pages#school_registration', as: :school_registration

  post '/check_coupon_code', to: 'subscriptions#check_coupon_code'

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
