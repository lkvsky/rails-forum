Forumz::Application.routes.draw do
  resources :users
  resources :posts
  resource :comment, :only => [:new, :create, :destroy]
  resource :session, :only => [:new, :create, :destroy]

  root to: "posts#index"
end
