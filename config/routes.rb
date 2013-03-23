Billy::Application.routes.draw do
  resources :billing_schedules
  resources :billing_period_ranges
  resources :bills do
    member do
      put 'pay'
      put 'settle'
    end
  end

  devise_for :users
  root :to => 'pages#home'
end
