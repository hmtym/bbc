Rails.application.routes.draw do
  # get 'static_pages/top'
  root 'static_pages#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tweets', to:'tweets#new'  # この行を追加
  post '/tweets/create', to:'tweets#create'  # この行を追加
  get '/contacts', to:'question#new'
  post '/question/create', to:'question#create' 
end