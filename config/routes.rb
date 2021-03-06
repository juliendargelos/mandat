Rails.application.routes.draw do

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  root 'static_pages#home'

  resources :cards
  get '/cards/:id/oui',to: 'cards#oui', as:'oui'
  get '/cards/:id/non',to: 'cards#non', as:'non'
  get '/gameover', to: 'static_pages#gameover'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
