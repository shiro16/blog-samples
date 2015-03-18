# routes.rbに書いてごめんなさい＞＜
class PcConstraint 
  def matches?(request)
    # ua check
    # uaがpcの場合にtrueを返す
    true
  end
end

Rails.application.routes.draw do
  resources :users

  get '/games',      to: 'games#index'
  get '/games/:id',  to: 'games#show'
  get '/games/test', to: 'games#test', as: :test

  # get '/users'      => 'users#index'
  # get '/users/:id'  => 'users#show'
  # get '/users/test' => 'users#test', as: :test

  resource :posts, except: [:index, :show]

  resource :hoge, controller: :users

  resource :authors do
    resource :books
  end

  resources :dogs do
    collection do
      get 'test1'
      get 'test2'
    end
  end

  resources :cats do
    member do
      get 'test3'
      get 'test4'
    end
  end
	
  resources :companies, only: [:index, :show, :create] do
    new do
      get 'test1'
      get 'test2'
    end
	end

  resources :hoge, only: [:index, :show], param: :user_id


  namespace :admin do
    resources :users, only: [:index, :show]
  end

  scope module: 'admin' do
    resources :authors, only: [:index, :show]
  end

  concern :categorize do
    resources :large_categories, only: [:index, :show] do
      get 'test'
	  end
  end

  resources :dogs, only: [:index], concerns: :categorize
  resources :cats, only: [:index], concerns: :categorize

  resources :small_categories, constraints: {id: /\d+/}

  resources :books, only: [:index, :show], constraints: {subdomain: 'admin'}

  get '/', to: 'pc#index', constraints: PcConstraint.new
	get '/', to: 'iphone#index', constraints: lambda {|request| request.user_agent =~ /iPhone/}

  get '/users/:id/default' => 'users#default', defaults: { format: :json }
  get '/posts/:id/default' => 'posts#default', defaults: { default_value: :hoge }

  resources :sports, only: [:index, :show]
  
  get "user"     => redirect("/users")
  get "user/:id" => redirect("/users/%{id}")
  get 'user/*other' => redirect { |params| "/users/#{params[:other]}"}
end
