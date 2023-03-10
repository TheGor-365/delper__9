Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  resource :contacts, only: [:new, :create], path_names: { :new => '' }

  resources :s_lessons
  resources :s_questions
  resources :s_projects
  resources :s_answers

  devise_for :accounts
  get 'home/index'
  root to: "home#index"
  devise_scope :account do
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  end


  # get 'contacts/index'
  # get 'contacts' => 'contacts#new'
  resources :technologies do
    resources :lessons
    resources :projects

    resources :questions do
      resources :answers
    end
  end
  # https://guides.rubyonrails.org/routing.html
end
