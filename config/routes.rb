Rails.application.routes.draw do
  root to: "musics#new"
  resources :musics
  post '/', to: 'musics#submit'
  get '/player', to: 'musics#player'
  post '/nextMusic/:id', to: 'musics#clearAnPlayNext'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
