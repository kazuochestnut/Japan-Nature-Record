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
    get 'users/my_page', to: 'users#my_page'
   
    get 'users/check', to: 'users#check'
    patch 'users/withdraw', to: 'users#withdraw'
    resource :users, only: [:show, :update]
    get 'users/my_page/edit' => 'users#edit', as: 'my_page_edit'
    get 'posts/location', to: 'posts#location'
    get 'posts/search', to: 'posts#search'

    resources :posts do
     resource :likes, only: [:create, :destroy]
     resources :post_comments, only: [:create, :destroy]
    end

    resources :relationships, only: [:create, :destroy]
 
    resources :users do
      member do
       get :following, :followers
      end
    end
  
 end

end
