Rails.application.routes.draw do
  resources :orders
  get 'admin/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :line_items
  resources :carts
  get 'store/index'

  resources :products do
    get 'who_bought', :on => :member
  end
  root :to => 'store#index'
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
end
