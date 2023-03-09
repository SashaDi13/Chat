Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'public#index'

  devise_scope :user do
    get '/users/sign_out', to: 'users/sessions#destroy'
  end

  scope "/:slug", module: 'account' do
    root to: 'rooms#index', as: :authenticated_root
    resources :rooms do
      resources :messages, only: [:create, :new]
    end

    resources :users
  end
end
