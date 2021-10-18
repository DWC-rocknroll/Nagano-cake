Rails.application.routes.draw do
  
  namespace :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'
    resources :customers, only: [:show, :edit, :update] do
      get 'confirm'
      patch 'leave'
    end
    resources :products, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      delete 'cart_items' => 'cart_items#destroy_all', as: "destroy"
    end
    resources :orders, only: [:new, :create, :index, :show] do
      get 'confirm'
      get 'complete'
    end
    resources :deliveries, only: [:index, :create, :destroy, :edit, :update]
  end
  
  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
