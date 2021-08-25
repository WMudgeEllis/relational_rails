Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/bookshelves', to: 'bookshelves#index'
  get '/car_lots', to: 'car_lots#index'
end
