Rails.application.routes.draw do
  get 'offers/index'
  get 'offers/skills'
  post 'offers/index'
  root 'offers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
