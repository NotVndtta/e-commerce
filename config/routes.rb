Rails.application.routes.draw do
  namespace :admin do
    resources :categories
  end
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
  # установка маршрута для корневой страницы администратора только для аутентифицированных пользователей с ролью admin_user
   authenticated :admin_user do
    root to: "admin#index", as: :admin_root
   end

   get "admin" => "admin#index"
end
