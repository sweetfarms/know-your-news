Rails.application.routes.draw do
  
  devise_for :users

  get 'news/index'
  get 'news/show'
  get 'news/update'
  get 'news/destroy'
  get 'news/create'

  root 'news#index'

  resources :news
  
end
