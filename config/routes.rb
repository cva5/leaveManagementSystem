Rails.application.routes.draw do
  scope "(:locale)", defaults: { :locale => "en" }  do
    devise_for :users, controllers: {:registrations => "users"}

    #root :to => "holidays#index"
    resources :leave_events do
      member do
        post :verify
        post :reject
      end
    end

    resources :users

    root "welcome#index"
  end
end
