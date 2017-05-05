Rails.application.routes.draw do
   root "page#index"
   resources :cards
   #get 'cards/:id/', to: 'cards#show'
   #, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
