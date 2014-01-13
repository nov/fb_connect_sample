FbConnect::Application.routes.draw do
  resource :session,   only: :destroy
  resource :dashboard, only: :show
  resource :facebook do
    member do
      get :authorize
      get :callback
    end
  end

  root 'top#show'
end
