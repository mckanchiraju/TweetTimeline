Rails.application.routes.draw do
<<<<<<< Updated upstream
  get 'events/index'
=======
  namespace :api do
    get 'stockprices/index'
  end

  namespace :api do
    get 'headlines/index'
  end

  namespace :api do
    get 'tweets/index'
  end
>>>>>>> Stashed changes

  root 'pages#index'

  get '/events' => 'events#index'
end
