FbConnect::Application.routes.draw do
  resource :session,   only: :destroy
  resource :dashboard, only: :show
  resource :facebook,  only: :show do
    member do
      get :callback
    end
  end

  root 'top#show'
end
