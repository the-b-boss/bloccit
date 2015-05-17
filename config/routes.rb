Rails.application.routes.draw do

  devise_for :users
    resources :users, only: [:update]
  
#  Deep route nestign can become cumbersome
#  resources :topics do
#     resources :posts, except: [:index] do
#        resources :comments, only: [:create, :destroy]
#      end
#   end

  resources :topics do 
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do 
    resources :comments, only: [:create, :destroy]
  end

  get 'about' =>'welcome#about'
  root to: 'welcome#index'
end
