Rails.application.routes.draw do

  devise_scope :user do
    authenticated :user do
      root 'users#show'
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new',  as:  :unauthenticated_root
    end
  end

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  devise_scope :user do
    get "/logout" => "devise/sessions#destroy"
  end

  ActiveAdmin.routes(self)

  get 'test' => 'pages#tests'
  get '/users/:id' => 'users#show'
  get '/questions/show' => 'questions#show'

  resources :questions, only: [:index, :new, :create, :show]
  resources :topics, only: [:index, :show, :new, :create]

  resources :users, only: [:create, :edit, :new, :show, :testpage, :update] do
    resources :test_suits do
      post :complete
       member do
           get 'test_me'
       end
    end
    resources :skills, only: [:index] do
      collection do
        patch :update
      end
    end
  end
end