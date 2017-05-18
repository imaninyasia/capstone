Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :uploads

  get '/shopfind' => 'shops#index'
  get '/upload' => 'shops#upload'
  get '/shops/:age_l/:age_h/:gender_v/:gender_c' => 'shops#users_shops'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
