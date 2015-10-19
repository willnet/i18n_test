Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'
  authenticate :admin do
    mount Translator::App, at: '/translator'
  end
end
