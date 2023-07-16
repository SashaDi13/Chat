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
    root to: 'users#index', as: :authenticated_root
  end
end
