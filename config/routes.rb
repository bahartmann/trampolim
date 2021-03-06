Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'events#index'

  resources :events do
    collection do
      get 'plays', to: 'events#index', category: 'play'
      get 'concerts', to: 'events#index', category: 'concert'
      get 'exibithions', to: 'events#index', category: 'exibithion'
    end
    member do
      put 'confirm', to: 'events#confirm'
      post 'comment', to: 'events#comment'
      post 'rating', to: 'events#rating'
    end
  end

  resources :user_profiles do
    member do
      put 'follow', to: 'user_profiles#follow'
    end
  end

end
