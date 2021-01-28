Rails.application.routes.draw do


  namespace :admin do
  resources :categories, except:[:new, :show, :destroy]
  resources :locations, except:[:new, :show, :destroy]
  resources :users, only:[:index, :show, :edit, :update]
  end

  devise_scope :admin do
    get 'admin' => 'admin/sessions#new' , as: 'homes'
    post 'admin' => 'admin/sessions#create'
    delete 'admin' => 'admin/sessions#destroy'
  end

  devise_for :admins


  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    passwords: 'public/users/passwords',
    registrations: 'public/users/registrations'
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'
    get 'users/my_page', to: 'users#show'
    get 'users/check', to: 'users#check'
    patch 'users/withdraw', to: 'users#withdraw'
    resource :users, only: [:update]
    get 'users/my_page/edit' => 'users#edit', as: 'my_page_edit'
    resources :posts
    get 'posts/location'
    resources :relationships, only: [:create, :destroy]
  end

  resources :users do
    member do
     get :following, :followers
    end
  end

end
