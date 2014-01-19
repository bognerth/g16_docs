G16Docs::Application.routes.draw do
  root :to => 'pages#index'

  resources :pages do
    member do
      get 'download'
    end
  end


end
