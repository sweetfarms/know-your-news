Rails.application.routes.draw do
  
  get 'news/index'

  get 'news/show'

  get 'news/update'

  get 'news/destroy'

  devise_for :users

  root 'welcome#index'
  
end
