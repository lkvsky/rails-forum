Forumz::Application.routes.draw do
  resources :users
  resources :posts
  resource :comment, :only => [:new, :create, :destroy, :show]
  resource :session, :only => [:new, :create, :destroy, :show]

  root to: "posts#index"
end
