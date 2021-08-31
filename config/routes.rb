Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'welcome#index'
  get '/bookshelves', to: 'bookshelves#index'
  get '/car_lots', to: 'car_lots#index'
  get '/bookshelves/:id', to: 'bookshelves#show'
  get '/car_lots/:id', to: 'car_lots#show'
  get '/vehicles', to: 'vehicles#index'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/vehicles/:id', to: 'vehicles#show'
  get '/bookshelves/:bookshelf_id/books', to: 'bookshelf_books#index'
  get '/car_lots/:car_lot_id/vehicles', to: 'car_lot_vehicles#index'

  get '/bookshelf/new', to: 'bookshelves#new'
  post '/bookshelves', to: 'bookshelves#create'

  get '/car_lot/new', to: 'car_lots#new'
  post '/car_lots', to: 'car_lots#create'

  get '/bookshelves/:bookshelf_id/edit', to: 'bookshelves#edit'
  patch '/bookshelves/:id', to: 'bookshelves#update'

  get '/car_lots/:car_lot_id/edit', to: 'car_lots#edit'
  patch '/car_lots/:id', to: 'car_lots#update'

  get '/car_lots/:car_lot_id/vehicles/new', to: 'car_lot_vehicles#new'
  post "/car_lots/:car_lot_id/vehicles", to: 'car_lot_vehicles#create'

  get '/bookshelves/:bookshelf_id/books/new', to: 'bookshelf_books#new'
  post "/bookshelves/:bookshelf_id/books", to: "bookshelf_books#create"

  get '/books/:book_id/edit', to: 'books#edit'
  patch '/books/:book_id', to: 'books#update'

  get '/vehicles/:vehicle_id/edit', to: 'vehicles#edit'
  patch '/vehicles/:vehicle_id', to: 'vehicles#update'

  delete '/car_lots/:car_lot_id', to: 'car_lots#destroy'
end
