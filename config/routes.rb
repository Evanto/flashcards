Rails.application.routes.draw do
   root "page#index"
   resources :cards, only: [:index]

   #, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
