# routes.rbに書いてごめんなさい＞＜
class PcConstraint 
  def matches?(request)
    # ua check
		# uaがpcの場合にtrueを返す
		true
  end
end

Rails.application.routes.draw do
  # get '/users',      to: 'users#index'
  # get '/users/:id',  to: 'users#show'
  # get '/users/test', to: 'users#test', as: :test

  # get '/users'      => 'users#index'
  # get '/users/:id'  => 'users#show'
  # get '/users/test' => 'users#test', as: :test

  # resources :users

  # resource :posts, except: [:index, :show]

  # resource :hoge, controller: :users

  # resource :users do
  #    resource :posts
  # end

  # resources :users do
  #   collection do
  #     get 'test1'
  #     get 'test2'
  #   end
  # end

  # resources :users do
  #   member do
  #     get 'test1'
  #     get 'test2'
  #   end
  # end
	
	# resources :users, only: [:index, :show, :create] do
  #   new do
  #     get 'test1'
  #     get 'test2'
  #   end
	# end

  # resources :hoge, only: [:index, :show], param: :user_id


  # namespace :admin do
  #   resources :users, only: [:index, :show]
  # end

  # scope module: 'admin' do
  #   resources :users, only: [:index, :show]
  # end

  # concern :commentable do
  #   resources :comments, only: [:index, :show] do
  #     get 'test'
	# 	end
  # end

  # resources :users, only: [:index], concerns: :commentable
  # resources :posts, only: [:index], concerns: :commentable

  # resources :users, constraints: {id: /\d+/}

  # resources :users, only: [:index, :show], constraints: {subdomain: 'admin'}

  # get '/', to: 'pc#index', constraints: PcConstraint.new
	# get '/', to: 'iphone#index', constraints: lambda {|request| request.user_agent =~ /iPhone/}

  # get '/users/:id/default' => 'users#default', defaults: { format: :json }
  # get '/posts/:id/default' => 'posts#default', defaults: { default_value: :hoge }

  # resources :users, only: [:index, :show]
  # get "user"     => redirect("/users")
  # get "user/:id" => redirect("/users/%{id}")
  # get 'user/*other' => redirect { |params| "/users/#{params[:other]}"}
end
