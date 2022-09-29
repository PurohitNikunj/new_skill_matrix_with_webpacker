Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
  resources :user_skills do
    resources :user_sub_skills
  end
  resources :profiles
  
  get '/add_secondaryskill', to:'user_skills#secondary', as: "add_secondaryskill"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#signin"
  get "/signinpopup", to: "articles#signinpopup"
  get "/selectdept", to: "onboardings#select_dept", as: "select_dept"

  get "/manager", to: "profiles#manager", as: "manager"

  get '/edit_primaryskill', to: "user_skills#edit_primaryskill"
  #get '/edit_secondaryskill', to: "users#edit_secondaryskill"

  match '/auth/:provider/callback', :to => 'auth#callback', :via => [:get, :post]
  get 'auth/signout'
end
