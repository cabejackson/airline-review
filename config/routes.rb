# namespace? resources? -- ask about these
Rails.application.routes.draw do
  # the root path
  root 'pages#index'
  namespace :api do
    namespace :v1 do
      # used slug instead of id as the primary param
      resources :airlines, param: :slug
      # scoped down to only use create and destroy
      resources :reviews, only: [:create, :destroy]
    end
  end
  #this routes requests that arent specified back to the index path
  get '*path', to: 'pages#index', via: :all
end
