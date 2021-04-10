Rails.application.routes.draw do
  root 'home#index'

  namespace :api, format: 'json' do
    resources :memos, only: %i[index create]
  end
end
