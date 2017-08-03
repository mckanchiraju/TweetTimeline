Rails.application.routes.draw do
  get 'events/index'

  root 'pages#index'

  get '/events' => 'events#index'
end
